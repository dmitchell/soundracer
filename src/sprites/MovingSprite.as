package sprites
{
	import org.flixel.FlxG;
	
	import states.GameStates;
	import states.PlayState;

	public class MovingSprite extends WrappingSprite
	{
		public function MovingSprite(X:Number=0, Y:Number=0, SimpleGraphic:Class=null, dir:uint=UP, speed:int=1)
		{
			super(X, Y, SimpleGraphic, dir, speed);
		}
		override public function update():void
		{
			
			// Make sure the game state is Playing. If not exit out of update since we should be paused.
			if (state.gameState != GameStates.PLAYING)
			{
				return;
			}
			else
			{
				// Add speed to instance's x based on direction
				//y -= speed;
				y -= (FlxG.state as PlayState).speed;
				if(y < (bottomBounds-frameHeight)) {
					y = topBounds - frameHeight;
				}
			}
			
			// Call update
			super.update();
		}
	}
}