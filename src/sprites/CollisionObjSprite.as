package sprites
{
	import model.CollisionObj;
	
	import org.flixel.FlxG;
	
	import states.PlayState;

	public class CollisionObjSprite extends WrappingSprite
	{
			public static const SPRITE_WIDTH:int = 40;
			public static const SPRITE_HEIGHT:int = 40;
			public static const TOON_HEIGHT:int = 120;
				
			import states.GameStates;
			
			public var obj:CollisionObj;
			public var effectOn:Boolean = false;
			public var playedEffect:Boolean = false;
			
			private var playState : PlayState;
			
			/**
			 * Simple sprite to represent a car. There are 4 types of cars, represented by TYPE_A, _B,
			 * _C, and _D constant.
			 *
			 * @param x start X
			 * @param y start Y
			 * @param direction the direction the sprite will move in
			 * @param speed the speed in pixels in which the sprite will move on update
			 */
			public function CollisionObjSprite(myObj:CollisionObj, x:Number, y:Number, type:int, direction:int, speed:int, playstate : PlayState)
			{
				obj = myObj;
				effectOn = false;
				playedEffect = false;
				
				super(x, y, null, direction, speed);
				loadGraphic(obj.onImage, false, false);
				
				frame = type;
				this.playState = playstate;
			}
			
			public function toggleEffect():void
			{
				if(effectOn)
				{
					loadGraphic(obj.onImage, false, false);
					FlxG.play(GameAssets.chime, 3);
				} else {
					loadGraphic((obj.offImage? obj.offImage : obj.onImage), false, false);
				}
				this.alpha = 0;
				if (obj.life >= 0) effectOn = !effectOn;
				
								
			}
			
			public function setPlayedEffect():void
			{
				playedEffect = true;
				var volume:int = obj.life < 0 ? 20 : 5; // if snake make volume louder
				FlxG.play(GameAssets.getClassByFilename(obj.audio), volume);
				if(obj.life < 0) {
					FlxG.play(GameAssets.getClassByFilename(obj.audio), 80);
					FlxG.play(GameAssets.getClassByFilename(obj.audio), 80);
					FlxG.play(GameAssets.getClassByFilename(obj.audio), 80);
				}
			}
			
			
			/**
			 * This update methods analyzes the direction and x position of the instance to see if it should
			 * be repositioned to the opposite side of the screen. If instance is facing right, it will restart
			 * on the left of the screen. The opposite will happen for anything facing left.
			 */
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
					
					// toon height may have to be re-calculated
					if(y < TOON_HEIGHT && playedEffect == false && effectOn)
					{
						setPlayedEffect();
						playState.points += obj.points;
						trace("inc'd points + " + obj.points + " = "  + playState.points);
					}
					
					
					// if at the very top, move penguins to bottom
					if(y < (bottomBounds-frameHeight)) {
						playedEffect = false;
						y = topBounds - frameHeight;
						this.visible = true;
					}
					

					if (this.alpha < 1) this.alpha += 0.01;

					
				}
				
				// Call update
				super.update();
			}
		}
	
		
}