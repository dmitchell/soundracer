package sprites
{
	public class Monster extends CollisionObjSprite
	{
		public function Monster(x:Number, y:Number, speed:int)
		{
			super(x, y, 0, 0, speed);
			
			loadGraphic(GameAssets.SnakeSprite, false, false, 45, 80);
		}
	}
}