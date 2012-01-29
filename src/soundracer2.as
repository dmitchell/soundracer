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
			// TODO load game info to get duration to compute height
			// Create Flixel Game.
			var height : int = 153000 * 60 / 1000; // msec * frames/msec
			super(480, height, StartState, 1, 60);
		}
	}
}