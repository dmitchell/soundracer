package sprites
{
	import model.CollisionObj;
	public class Monster extends CollisionObjSprite
	{
		public function Monster(obj:CollisionObj,x:Number, y:Number, speed:int)
		{
			super(obj, x, y, 0, 0, speed);
			
			
			
			//loadGraphic(GameAssets.SnakeSprite, false, false);
		}
	}
}