package states
{

	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import model.CollisionObj;
	import model.Game;
	
	import org.flixel.*;
	
	import sprites.*;
	
	public class PlayState extends FlxState
	{
		
		public var gameState:uint;
		private const TILE_SIZE:int = 60;
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
		
		private var gameTimer : Timer;
		private var placeNewPiecesTimer : Timer
		private var timer:int = 0;
		
		private var lives:int = 10;
		public var points:int = 0;
		private var game : Game;
		
		public var speed:int;
		
		
		/**
		 * This is the main level of Frogger.
		 */
		public function PlayState(game : Game)
		{
			this.game = game;
			this.speed = 1;
			super();
		}
		
		/**
		 * This is the main method responsible for creating all of the game pieces and layout out the level.
		 */
		override public function create():void
		{
			// Create the BG sprite
			var bgBegin:MovingSprite = new MovingSprite(0, 0, GameAssets.BackgroundStart);
			var bg:WrappingSprite = bgBegin;
			for (var bottom : int = bg.height; bottom < FlxG.height; bottom += bg.height) {
				bg = new MovingSprite(0, bottom, GameAssets.Background);
				add(bg);
			}
			// add here in order to keep on top
			add(bgBegin);
			
			// Activate game by setting the correct state
			gameState = GameStates.PLAYING;
			lives = 5;
			
			// create player
			player = add(new MainChar(0, calculateRow(3))) as MainChar;
			
			if(game.musicManager)
			{
				game.musicManager.play();
			} else {
				
				FlxG.play(GameAssets.soundracerTrack1);
			}
			
			createInitialPieces();
			placeNewPiecesTimer = new Timer(game.lapDuration, 0);
			placeNewPiecesTimer.addEventListener(TimerEvent.TIMER, addPieces);
			placeNewPiecesTimer.start();
			
			gameTimer = new Timer(1000, 0);
			gameTimer.addEventListener(TimerEvent.TIMER, updateTime);
			gameTimer.start();

			// create messages and objs
			createGameMessages();
		}
		
		protected function updateTime(event:TimerEvent):void
		{
			timeText.text = "TIME " + gameTimer.currentCount;
		}
		
		public function createGameMessages():void
		{
			// Create game message, this handles game over, time, and start message for player
			gameMessageGroup = new FlxGroup();
			add(gameMessageGroup);
			
			
			// Message text
			messageText = new FlxText(150, 30, 150, "").setFormat(null, 18, 0x191970, "center");
			timeText = new FlxText(0, 4, 150, "TIME 0").setFormat(null, 18, 0x191970, "center");
			livesText = new FlxText(150, 4, 150, "LIVES "+String(lives)).setFormat(null, 18, 0x191970, "center");
			pointsText = new FlxText(300, 4, 150, "CHOIR SIZE: " + String(points)).setFormat(null, 18, 0x191970, "center");
			
			gameMessageGroup.add(messageText);
			gameMessageGroup.add(timeText);
			gameMessageGroup.add(livesText);
			gameMessageGroup.add(pointsText);
			gameMessageGroup.visible = true;
			
		}
		
		public function createInitialPieces():void
		{
			collisionPieces = add(new FlxGroup()) as FlxGroup;
			createPieces(30, 10);
		}
		
		private function createPieces( number : int, forceSnakes : int = 0 ) : void {
			trace("Add " + number );
			var pieceCount : int = game.pieceLibrary.library.length;
			
			
			var snake : CollisionObj;
			for each (var c : CollisionObj in game.pieceLibrary.library) {
				if (c.life < 0) {
					snake = c;
					break;
				}
			}
			
			var rand:int = FlxG.height/TILE_SIZE;

			for(var s:int = 0; s < forceSnakes; s++)
			{
				//var x0:int = Math.random()*420;
				var x0:int = calculateColumn(Math.random()*8);
				//var y0:int = int(Math.random() * FlxG.height);
				var y0:int = calculateColumn(Math.random()*rand);
				collisionPieces.add(new CollisionObjSprite(snake, x0, y0, 0, 0, 1, this));
			}
			for(var i:int = 0; i < number; i++)
			{
				var index : int = Math.random() * (pieceCount + 3);
				var template : CollisionObj = (index >= pieceCount ? snake : game.pieceLibrary.library[index]);
				//var x:int = Math.random()*420;
				var x:int = calculateColumn(Math.random()*12);
				//var y:int = int(Math.random() * FlxG.height);
				var y:int = calculateColumn(Math.random()*rand);
				collisionPieces.add(new CollisionObjSprite(template, x, y, 0, 0, 1, this));
			}
		}
		private function addPieces(e : TimerEvent = null) : void {
			createPieces(30, 10);
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
					FlxG.switchState(new EndState(points));
				}
				else
				{
					hideGameMessageDelay -= FlxG.elapsed;
				}
			}
			else if (gameState == GameStates.PLAYING)
			{
				// change the speed if the speed increased
				if(FlxG.keys.pressed("DOWN"))
				{
					speed = 8;	
					
				} else if(FlxG.keys.pressed("UP")) 
				{
					speed = 1;
				}else {
					speed = 4;
				}
				// Do collision detections
				FlxG.overlap(collisionPieces, player, collide);
				pointsText.text = "CHOIR SIZE: " + String(points);

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
				lives = lives + target.obj.life;
				livesText.text = "LIVES "+String(lives);

				
				target.toggleEffect();
				target.setPlayedEffect();
				
				if(target.obj.life < 0)
				{
					player.gotAttacked();
				} else if (target.effectOn) {
					// if we just turned the player on, we added them to our choir
					points++;
				} else {
					// otherwise we remove them from our choir
					points--;
				}
				
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
				player.death();
				if (game.musicManager) game.musicManager.stop();
				else trace("Not valid");
				
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
			hideGameMessageDelay = 200;
			
			gameTimer.stop();
			placeNewPiecesTimer.stop();
			
			collisionPieces.visible = false;
		}
		
		/**
		 * This removed the click listener.
		 */
		override public function destroy():void
		{
			super.destroy();
		}
	}
}