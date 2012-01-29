package states
{
	import flash.media.Sound;
	import flash.net.URLRequest;
	
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
		
		private var MonsterGroup:FlxGroup;
		private var FriendGroup:FlxGroup
		
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
		
		/**
		 * This is the main level of Frogger.
		 */
		public function PlayState()
		{
			super();
		}
		
		/**
		 * This is the main method responsible for creating all of the game pieces and layout out the level.
		 */
		override public function create():void
		{
			// Create the BG sprite
			var bg:FlxSprite = new FlxSprite(0, 0, GameAssets.LevelSprite);
			add(bg);
			
			// Activate game by setting the correct state
			gameState = GameStates.PLAYING;
			
			// create player
			player = add(new MainChar(0, calculateRow(3))) as MainChar;
			
			gameTime = 60 * FlxG.framerate;
			
			// create messages and objs
			createGameMessages();
			//addCollisionObjs();
			createMonsterGroup();
			createFriendGroup();
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
			messageText = new FlxText(150, 30, 150, "").setFormat(null, 18, 0xffff00000, "center");
			timeText = new FlxText(0, 4, 150, "TIME 99").setFormat(null, 18, 0xffff00000, "center");
			livesText = new FlxText(150, 4, 150, "LIVES "+String(lives)).setFormat(null, 18, 0xffff00000, "center");
			pointsText = new FlxText(320, 4, 150, "POINTS " + String(points)).setFormat(null, 18, 0xfff00000, "center");
			
			gameMessageGroup.add(messageText);
			gameMessageGroup.add(timeText);
			gameMessageGroup.add(livesText);
			gameMessageGroup.add(pointsText);
			gameMessageGroup.visible = true;
			
		}
		
		public function createMonsterGroup():void
		{
			MonsterGroup = add(new FlxGroup()) as FlxGroup;
			
			for(var i:int = 0; i < 10; i++)
			{
				var x:int = Math.random()*480
				var y:int = calculateRow(1+int(Math.random()*50));
				MonsterGroup.add(new Monster(x,y,1));
			}
			
			
		}
		
		public function createFriendGroup():void
		{
			FriendGroup = add(new FlxGroup()) as FlxGroup;
			
			for(var i:int = 0; i < 15; i++)
			{
				var x:int = Math.random()*480
				var y:int = calculateRow(1+int(Math.random()*50));
				var f:Friend = new Friend(x,y,1);
				FriendGroup.add(f);
			}
		}
		
		public function addCollisionObjs():void
		{
			
			// Create CollisionObjSprites
			CollisionObjSpriteGroup = add(new FlxGroup()) as FlxGroup;
			
			CollisionObjSpriteGroup.add(new CollisionObjSprite(0, calculateRow(10), CollisionObjSprite.TYPE_C, 0, 1));
			CollisionObjSpriteGroup.add(new CollisionObjSprite(270, calculateRow(10), CollisionObjSprite.TYPE_C, 0, 1));
			
			CollisionObjSpriteGroup.add(new CollisionObjSprite(0, calculateRow(11), CollisionObjSprite.TYPE_D, 0, 1));
			CollisionObjSpriteGroup.add(new CollisionObjSprite(270, calculateRow(11), CollisionObjSprite.TYPE_D, 0, 1));
			
			CollisionObjSpriteGroup.add(new CollisionObjSprite(0, calculateRow(12), CollisionObjSprite.TYPE_B, 0, 1));
			CollisionObjSpriteGroup.add(new CollisionObjSprite((CollisionObjSprite.SPRITE_WIDTH + 138) * 1, calculateRow(12), CollisionObjSprite.TYPE_B, 0, 1));
			CollisionObjSpriteGroup.add(new CollisionObjSprite((CollisionObjSprite.SPRITE_WIDTH + 138) * 2, calculateRow(12), CollisionObjSprite.TYPE_B, 0, 1));
			
			CollisionObjSpriteGroup.add(new CollisionObjSprite(0, calculateRow(13), CollisionObjSprite.TYPE_A, 0, 1));
			CollisionObjSpriteGroup.add(new CollisionObjSprite((CollisionObjSprite.SPRITE_WIDTH + 138) * 1, calculateRow(13), CollisionObjSprite.TYPE_A, 0, 1));
			CollisionObjSpriteGroup.add(new CollisionObjSprite((CollisionObjSprite.SPRITE_WIDTH + 138) * 2, calculateRow(13), CollisionObjSprite.TYPE_A, 0, 1));
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
			else if (gameState == GameStates.LEVEL_OVER)
			{
				
			}
			else if (gameState == GameStates.PLAYING)
			{
				// Do collision detections
				//FlxG.overlap(CollisionObjSpriteGroup,player, carCollision);
				FlxG.overlap(MonsterGroup, player, monsterCollision);
				FlxG.overlap(FriendGroup, player, friendCollision);
				
				/*
				var monsterMembers:Array = MonsterGroup.members;
				var i:int = 0;
				while(i < monsterMembers.length)
				{
					FlxG.overlap(monsterMembers[i], player, monsterCollision);
					i++;
				}*/
				
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
		
		/**
		 * This handles collision with a car.
		 * @param target this instance that has collided with the player
		 * @param player a reference to the player
		 */
		private function carCollision(target:FlxSprite, player:MainChar):void
		{
			if (gameState != GameStates.COLLISION)
			{
				//FlxG.play(GameAssets.FroggerSquashSound);
				//lives--;
				//livesText.text = "LIVES "+String(lives);
				//killPlayer();
			}
		}
		
		private function monsterCollision(target:FlxSprite, player:MainChar):void
		{
			
			//target.alive = false;
			//target.destroy();
			lives--;
			livesText.text = "LIVES "+String(lives);
			
			if(lives <= 0)
			{
				restart();
			}
		}
		private var ding : Sound = new Sound(new URLRequest("sounds/soundracerTrack1.mp3"));
		private function friendCollision(target:FlxSprite, player:MainChar):void
		{
			// if collides with friends
			ding.play();
			points++;
			pointsText.text = "POINTS " + String(points);
			
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
			
			FriendGroup.visible = false;
			MonsterGroup.visible = false;
		}
	}
}