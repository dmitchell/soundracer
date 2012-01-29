package sprites
{
	public class Friend extends CollisionObjSprite
	{
		
		private var hit:Boolean;
		public function Friend(x:Number, y:Number, speed:int)
		{
			hit = false;
			super(x, y, 0, 0, speed);
			
			loadGraphic(GameAssets.PenguinSprite, false, false, 60, 60);
		}
		
		public function setHit(isHit:Boolean)
		{
			hit = isHit;
		}
		
		public function isHit():Boolean
		{
			return hit;
		}
	}
}