package sprites
{
	import flash.geom.Point;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	import states.GameStates;
	import states.PlayState;
	
	public class MainChar extends FlxSprite
	{
		
		private var startPosition:Point;
		private var moveX:int;
		private var maxMoveX:int;
		private var maxMoveY:int;
		private var targetX:Number;
		private var targetY:Number;
		private var animationFrames:int = 8;
		private var moveY:Number;
		private var state:PlayState;
		public var isMoving:Boolean;
		
		public var toggle:int;
		public var countdown:int;
		
		public function MainChar(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			
			// Save the starting position to be used later when restarting
			startPosition = new Point(X, Y);
			
			// Calculate amount of pixels to move each turn
			moveX = 5;
			moveY = 5;
			maxMoveX = moveX * animationFrames;
			maxMoveY = moveY * animationFrames;
			
			// Set frog's target x,y to start position so he can move
			targetX = X;
			targetY = Y;
			
			// Set up sprite graphics and animations
			loadGraphic(GameAssets.PenguinSprite, true, false, 60, 60);
			
			addAnimation("idle" + UP, [0], 0, false);
			addAnimation("idle" + RIGHT, [2], 0, false);
			addAnimation("idle" + DOWN, [4], 0, false);
			addAnimation("idle" + LEFT, [6], 0, false);
			addAnimation("walk" + UP, [0,1], 15, true);
			addAnimation("walk" + RIGHT, [2,3], 15, true);
			addAnimation("walk" + DOWN, [4,5], 15, true);
			addAnimation("walk" + LEFT, [6,7], 15, true);
			addAnimation("die", [8, 9, 10, 11], 2, false);
			
			// Set facing direction
			facing = UP;
			toggle = 0;
			
			// Save an instance of the PlayState to help with collision detection and movement
			state = FlxG.state as PlayState;
		}
		
		/**
		 * This update methods analyzes the direction and x position of the instance to see if it should
		 * be repositioned to the opposite side of the screen. If instance is facing right, it will restart
		 * on the left of the screen. The opposite will happen for anything facing left.
		 */
		override public function update():void
		{
			if (state.gameState == GameStates.PLAYING)
			{
				
				// Test to see if TargetX and Y are equal. If so, Frog is free to move.
				if (Math.abs(targetX-x) < moveX && Math.abs(targetY-y) < moveY)
				{
					// Checks to see what key was just pressed and sets the target X or Y to the new position
					// along with what direction to face
					if ((FlxG.keys.pressed("LEFT")) && x > 0)
					{
						targetX = x - maxMoveX;
						facing = LEFT;
					}
					else if ((FlxG.keys.pressed("RIGHT")) && x < FlxG.width - frameWidth)
					{
						targetX = x + maxMoveX;
						facing = RIGHT;
					}

					
					// See if we are moving
					if (x != targetX || y != targetY)
					{
						// Once this flag is set, the frog will not take keyboard input until it has reacged its target
						isMoving = true;
						
					}
					else
					{
						// Nope, we are not moving so flag isMoving and show Idle.
						isMoving = false;
						
					}
					
				}
				
				
				// If isMoving is true we are going to update the actual position.
				if (isMoving == true)
				{
					if (facing == LEFT)
					{
						x -= moveX;
					} else if (facing == RIGHT)
					{
						x += moveX;
					} else if (facing == UP)
					{
						y -= moveY;
					} else if (facing == DOWN)
					{
						y += moveY;
					}
					
					// Play the walking animation
					play("walk" + facing);
					
				}
				else
				{
					// nothing is happening so go back to idle animation
					play("idle" + facing);
				}
				
				if(countdown > 0)
				{
					countdown--;
				} else if (countdown == 0)
				{
					loadGraphic(GameAssets.PenguinSprite, true, false, 60, 60);
					countdown = -1;	
				}
				
			}
			
			
			
			// rotate Mr. Penguin
			if(toggle == 0) this.angle -= 20;
			else if(toggle==1) this.angle += 20;
			toggle = (toggle+1)%2;
			
			super.update();
		}
		
		public function gotAttacked():void
		{
			loadGraphic(GameAssets.InjuredPenguin, true, false, 60, 60);
			countdown = 15;
		}
		
		/**
		 * This manage what direction the frog is facing. It also alters the bounding box around the sprite.
		 *
		 * @param value
		 */
		override public function set facing(value:uint):void
		{
			super.facing = value;
			
			if (value == UP || value == DOWN)
			{
				width = 32;
				height = 25;
				offset.x = 4;
				offset.y = 6;
			}
			else
			{
				width = 25;
				height = 32;
				offset.x = 6;
				offset.y = 4;
			}
		}
		
		/**
		 * Simply plays the death animation
		 */
		public function death():void
		{
			loadGraphic(GameAssets.InjuredPenguin, true, false);
		}
		
		/**
		 * This resets values of the Frog instance.
		 */
		public function restart():void
		{
			
		}
		
		/**
		 * This handles moving the Frog in the same direction as any instance it is resting on.
		 *
		 * @param speed the speed in pixels the Frog should move
		 * @param facing the direction the frog will float in
		 */
		public function float(speed:int, facing:uint):void
		{
			
		}
	}
	
	
}