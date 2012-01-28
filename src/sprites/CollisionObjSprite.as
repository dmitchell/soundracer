package sprites
{
	public class CollisionObjSprite extends WrappingSprite
	{
			public static const SPRITE_WIDTH:int = 40;
			public static const SPRITE_HEIGHT:int = 40;
			
			public static const TYPE_A:int = 0;
			public static const TYPE_B:int = 1;
			public static const TYPE_C:int = 2;
			public static const TYPE_D:int = 3;
			
			/**
			 * Simple sprite to represent a car. There are 4 types of cars, represented by TYPE_A, _B,
			 * _C, and _D constant.
			 *
			 * @param x start X
			 * @param y start Y
			 * @param type type of car to use. Type_A, _b, _c, and _d are referenced as constants on the class
			 * @param direction the direction the sprite will move in
			 * @param speed the speed in pixels in which the sprite will move on update
			 */
			public function CollisionObjSprite(x:Number, y:Number, type:int, direction:int, speed:int)
			{
				super(x, y, null, direction, speed);
				
				loadGraphic(GameAssets.CarSpriteImage, false, false, 80, 120);
				
				frame = type;
			}
	}
}