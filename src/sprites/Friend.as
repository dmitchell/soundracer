package sprites
{
	public class Friend extends CollisionObjSprite
	{
		public function Friend(x:Number, y:Number, speed:int)
		{
			super(x, y, 0, 0, speed);
			
			loadGraphic(GameAssets.PenguinSprite, false, false, 60, 60);
		}
	}
}