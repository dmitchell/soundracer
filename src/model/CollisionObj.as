package model
{
	import flash.media.Sound;
	
	import spark.components.Image;

	public class CollisionObj
	{
		public static const ROLE_PLAY : String = "PLAY";
		public static const ROLE_LOOP : String = "LOOP";
		public static const ROLE_DECREASE_VOL : String = "DECREASE";
		public static const ROLE_INCREASE_VOL : String = "INCREASE";
		public static const ROLE_PAN_LEFT : String = "LEFT";
		public static const ROLE_PAN_RIGHT : String = "LEFT";
		
		public var isOn : Boolean;
		public var onImage : Image;
		/**
		 * Optional arg if the image changes based on whether it's been hit 
		 */
		public var offImage : Image;
		/**
		 * Which channel (track in MusicManager) is effected by collision 
		 */
		public var channel : int;
		
		/**
		 *  enum from class's ROLE consts: play, loop, decrease, increase, left, right
		 */
		public var role : String;
		public var audio : Sound;
		
		public var points : int;
		public var life : int;
		
		public function CollisionObj()
		{
		}
	}
}