package states
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	
	import model.CollisionObj;
	import model.Game;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	import sprites.GameAssets;
	
	import states.PlayState;
	
	public class StartState extends FlxState
	{
		public var game : Game;
		
		public function StartState()
		{
			super();
		}
		
		/**
		 * Goes through and creates the graphics needed to display the start message
		 */
		override public function create():void
		{
			
			// splash screen
			var splash:FlxSprite = new FlxSprite(0, 0, GameAssets.SplashScreen);
			add(splash);

			FlxG.stage.addEventListener(MouseEvent.CLICK, onClick);
			
			//add(new FlxText(0, 200, FlxG.width, "PUSH").setFormat(null, 18, 0xffffffff, "center"));
			//add(new FlxText(0, 300, FlxG.width, "ANYWHERE TO START").setFormat(null, 18, 0xd33bd1, "center"));
			
			//var title:FlxSprite = new FlxSprite(0, 100, GameAssets.AlligatorSprite);
			//title.x = (FlxG.width * .5) - (title.width * .5);
			//add(title);
			
			game = new Game("config/soundRacerGame.xml", "config/soundRacerGamePieces.xml"); 

		}
		
		protected function showGameData(event:Event):void
		{
			add(new FlxText(0, 0, FlxG.width, "Duration: " + game.lapDuration));
			var msg : String = "Music Manager: ";
			for each (var track : Sound in game.musicManager) {
				msg += track.bytesTotal + "bytes ";
			}
			add(new FlxText(0, 20, FlxG.width, msg));
			
			msg = "Pieces: ";
			var y : int = 0;
			for each (var obj : CollisionObj in game.pieceLibrary.library) {
				msg += "C" + obj.channel + " Life " + obj.life + " points: " + obj.points + obj.role;
				trace(obj.onImage, obj.offImage);
				add(new FlxSprite(300, y, obj.onImage));
				add(new FlxSprite(500, y, obj.offImage));
				y += 200;
			}
			add(new FlxText(0, 40, FlxG.width, msg));
		}
		
		/**
		 * Handles when the user clicks and changes to the PlayState.
		 * @param event MouseEvent
		 */
		private function onClick(event:MouseEvent):void
		{
			FlxG.switchState(new PlayState(game));
		}
		
		/**
		 * This removed the click listener.
		 */
		override public function destroy():void
		{
			FlxG.stage.removeEventListener(MouseEvent.CLICK, onClick);
			super.destroy();
		}
		
	}
}