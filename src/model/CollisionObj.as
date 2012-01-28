package model
{
	import flash.display.Loader;
	import flash.media.Sound;
	
	import org.flixel.FlxSprite;
	
	public class CollisionObj
	{
		public static const ROLE_PLAY : String = "PLAY";
		public static const ROLE_MUTE : String = "MUTE";
		public static const ROLE_DECREASE_VOL : String = "DECREASE";
		public static const ROLE_INCREASE_VOL : String = "INCREASE";
		public static const ROLE_PAN_LEFT : String = "LEFT";
		public static const ROLE_PAN_RIGHT : String = "LEFT";
		
		public var onImage : Class;
		/**
		 * Optional arg if the image changes based on whether it's been hit 
		 */
		public var offImage : Class;
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