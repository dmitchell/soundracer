package states
{
	import org.flixel.*;
	import org.flixel.FlxState;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import sprites.GameAssets;
	
	public class EndState extends FlxState
	{
		public var score:int;
		public function EndState(score:int)
		{
			this.score = score;
			super();
		}
		
		override public function create():void
		{
			FlxG.stage.addEventListener(MouseEvent.CLICK, onClick);
			
			// splash screen
			var splash:FlxSprite = new FlxSprite(0, 0, GameAssets.EndScreen);
			add(splash);
			
			add(new FlxText(0, 390, FlxG.width, "Score: " + String(score)).setFormat(null, 30, 0xd33bd1, "center"));
			
			FlxG.play(GameAssets.endCreditSong);
		}
		
		/**
		 * Handles when the user clicks and changes to the PlayState.
		 * @param event MouseEvent
		 */
		private function onClick(event:MouseEvent):void
		{
			FlxG.switchState(new StartState());
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