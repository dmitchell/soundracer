package states
{

	import flash.events.TextEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	import model.CollisionObj;
	import model.Game;
	
	import org.flixel.*;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	import sprites.*;
	
	public class PlayState extends FlxState
	{
		
		public var gameState:uint;
		private const TILE_SIZE:int = 40;
		private var CollisionObjSpriteGroup:FlxGroup;
		private var player:MainChar;
		
		private var collisionPieces :FlxGroup;
		
		// messages
		private var messageText:FlxText;
		private var timeText:FlxText;
		private var livesText:FlxText;
		private var pointsText:FlxText;
		private var gameMessageGroup:FlxGroup;
		private var hideGameMessageDelay:int = -1;
		
		private var gameTime:int = 0;
		private var timer:int = 0;
		
		private var lives:int = 10;
		private var points:int = 0;
		private var game : Game;
		
		/**
		 * This is the main level of Frogger.
		 */
		public function PlayState(game : Game)
		{
			this.game = game;
			super();
		}
		
		/**
		 * This is the main method responsible for creating all of the game pieces and layout out the level.
		 */
		override public function create():void
		{
			// Create the BG sprite
			var bg:FlxSprite = new FlxSprite(0, 0, GameAssets.Background);
			add(bg);
			
			// Activate game by setting the correct state
			gameState = GameStates.PLAYING;
			lives = 10;
			
			// create player
			player = add(new MainChar(0, calculateRow(3))) as MainChar;
			
			gameTime = 60 * FlxG.framerate;
			
			if(game.musicManager)
			{
				game.musicManager.play();
			} else {
				FlxG.play(GameAssets.soundracerTrack1);
			}
			
			// create messages and objs
			createGameMessages();
			
			createInitialPieces();
			var placeNewPiecesTimer : Timer = new Timer(game.lapDuration, 9);
			placeNewPiecesTimer.addEventListener(TimerEvent.TIMER, addPieces);
			placeNewPiecesTimer.start();
		}
		
		public function createGameMessages():void
		{
			// Create game message, this handles game over, time, and start message for player
			gameMessageGroup = new FlxGroup();
			//gameMessageGroup.x = (480 * .5) - (150 * .5);
			//gameMessageGroup.y = calculateRow(8) + 5;
			add(gameMessageGroup);
			
			// Black background for message
			//var messageBG:FlxSprite = new FlxSprite(0, 0);
			//messageBG.createGraphic(150, 30, 0xff000000);
			//gameMessageGroup.add(messageBG);
			
			// Message text
			messageText = new FlxText(150, 30, 150, "").setFormat(null, 18, 0x191970, "center");
			timeText = new FlxText(0, 4, 150, "TIME 99").setFormat(null, 18, 0x191970, "center");
			livesText = new FlxText(150, 4, 150, "LIVES "+String(lives)).setFormat(null, 18, 0x191970, "center");
			pointsText = new FlxText(320, 4, 150, "POINTS " + String(points)).setFormat(null, 18, 0x191970, "center");
			
			gameMessageGroup.add(messageText);
			gameMessageGroup.add(timeText);
			gameMessageGroup.add(livesText);
			gameMessageGroup.add(pointsText);
			gameMessageGroup.visible = true;
			
		}
		
		public function createInitialPieces():void
		{
			collisionPieces = add(new FlxGroup()) as FlxGroup;
			createPieces(153/3);
		}
		private function createPieces( number : int ) : void {
			trace("Add " + number );
			var pieceCount : int = game.pieceLibrary.library.length;
			
			
			var snake : CollisionObj;
			for each (var c : CollisionObj in game.pieceLibrary.library) {
				if (c.life < 0) {
					snake = c;
					break;
				}
			}
			
			for(var i:int = 0; i < number; i++)
			{
				var index : int = Math.random() * (pieceCount + 3);
				var template : CollisionObj = (index >= pieceCount ? snake : game.pieceLibrary.library[index]);
				var x:int = Math.random()*420;
				var y:int = int(Math.random() * FlxG.height);
				collisionPieces.add(new CollisionObjSprite(template, x, y, 0, 0, 1));
			}
		}
		private function addPieces(e : TimerEvent = null) : void {
			createPieces(153/6);
		}
		
		/**
		 * Helper function to find the X position of a column on the game's grid
		 * @param value column number
		 * @return returns number based on the value * TILE_SIZE
		 */
		public function calculateColumn(value:int):int
		{
			return value * TILE_SIZE;
		}
		
		/**
		 * Helper function to find the Y position of a row on the game's grid
		 * @param value row number
		 * @return returns number based on the value * TILE_SIZE
		 */
		public function calculateRow(value:int):int
		{
			return calculateColumn(value);
		}
		
		/**
		 * This is the main game loop. It goes through, analyzes the game state and performs collision detection.
		 */
		override public function update():void
		{
			
			if (gameState == GameStates.GAME_OVER)
			{
				if (hideGameMessageDelay == 0)
				{
					FlxG.switchState(new StartState());
				}
				else
				{
					hideGameMessageDelay -= FlxG.elapsed;
				}
			}
			else if (gameState == GameStates.PLAYING)
			{
				// Do collision detections
				FlxG.overlap(collisionPieces, player, collide);
				
				// Regardless if the base was empty or occupied we still display the time it took to get there
				gameTime++;
				timeText.text = "TIME " + String(int(gameTime / FlxG.framerate) );
			}
			else if (gameState == GameStates.DEATH_OVER)
			{
				
			}
			

			// Update the entire game
			super.update();
		}
		
		
		private function collide(target:CollisionObjSprite, player:MainChar):void
		{
			if(target.playedEffect == false)
			{
				trace("hit: " + target.obj + target.obj.life + "," + target.obj.points);
				lives = lives + target.obj.life;
				livesText.text = "LIVES "+String(lives);

				points = points + target.obj.points;
				pointsText.text = "POINTS " + String(points);
				
				target.toggleEffect();
				target.setPlayedEffect(true);
				if(lives <= 0)
				{
					restart();
				}
			}
		}
		
		
		
		/**
		 * This kills the player. Game state is set to collision so everything knows to pause and a life is removed.
		 */
		private function killPlayer():void
		{
			gameState = GameStates.COLLISION;
			player.death();
		}
		
		/**
		 * This handles resetting game values when a frog dies, or a level is completed.
		 */
		private function restart():void
		{
			// Make sure the player still has lives to restart
			if (lives <= 0 && gameState != GameStates.GAME_OVER)
			{
				gameOver();
			} 
		}
		
		
		/**
		 * This is called when a game is over. A message is shown and the game locks down until it is ready to go
		 * back to the start screen
		 */
		private function gameOver():void
		{
			
			gameState = GameStates.GAME_OVER;
			
			messageText.visible = true;
			messageText.text = "GAME OVER";
			hideGameMessageDelay = 100;
			
			collisionPieces.visible = false;
		}
	}
}