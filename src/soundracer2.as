package
{
	import flash.display.Sprite;
	import states.StartState;
	import org.flixel.FlxGame;
	
	[SWF(width="480", height="800", backgroundColor="#000000")]
	
	public class soundracer2 extends FlxGame
	{
		public function soundracer2()
		{
			trace("creating game");
			// Create Flixel Game.
			super(480, 800, StartState, 1);
		}
	}
}