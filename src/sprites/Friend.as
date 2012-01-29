package sprites
{
	import model.CollisionObj;
	public class Friend extends CollisionObjSprite
	{
		
		public function Friend(obj:CollisionObj,x:Number, y:Number, speed:int)
		{
			super(obj,x, y, 0, 0, speed);
			
			//loadGraphic(GameAssets.PenguinSprite, false, false);
		}
		
	}
}