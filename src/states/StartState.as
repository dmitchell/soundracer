package states
{
	import flash.events.MouseEvent;
	
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	import states.PlayState;
	import sprites.GameAssets;
	
	public class StartState extends FlxState
	{
		public function StartState()
		{
			super();
		}
		
		/**
		 * Goes through and creates the graphics needed to display the start message
		 */
		override public function create():void
		{
			//var sprite:FlxSprite = new FlxSprite();
			//sprite.createGraphic(FlxG.width, FlxG.height / 2, 0xff000047);
			
			
			//add(sprite);
			FlxG.stage.addEventListener(MouseEvent.CLICK, onClick);
			
			add(new FlxText(0, 200, FlxG.width, "PUSH").setFormat(null, 18, 0xffffffff, "center"));
			add(new FlxText(0, 300, FlxG.width, "ANYWHERE TO START").setFormat(null, 18, 0xd33bd1, "center"));
			
			var title:FlxSprite = new FlxSprite(0, 100, GameAssets.AlligatorSprite);
			title.x = (FlxG.width * .5) - (title.width * .5);
			add(title);
		}
		
		/**
		 * Handles when the user clicks and changes to the PlayState.
		 * @param event MouseEvent
		 */
		private function onClick(event:MouseEvent):void
		{
			FlxG.switchState(new PlayState());
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