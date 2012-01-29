package model
{
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	import sprites.GameAssets;
	
	public class PieceLibrary
	{
		public var library : Array = new Array();
		
		public function PieceLibrary(configXml : XML)
		{
			for (var i : int = 0; i < configXml.child("collision_obj").length(); i++) {
				var collision : CollisionObj = new CollisionObj();
				var collisionSpec : XML = configXml.collision_obj[i];
				
				library[i] = collision;
				if (collisionSpec.attribute("image").length() > 0) {
					collision.onImage = GameAssets.getClassByFilename(collisionSpec.@image);
				}
				if (collisionSpec.attribute("off_image").length() > 0) {
					collision.offImage = GameAssets.getClassByFilename(collisionSpec.@off_image);
				}
				if (collisionSpec.attribute("audio").length() > 0) {
					var filename : String = collisionSpec.@audio;
					if (filename.search(".swf")) {
						collision.audio = GameAssets.getClassByFilename(collisionSpec.@audio) as Sound;
					}
					else {
						collision.audio = new Sound(new URLRequest("sounds/" + collisionSpec.@audio));
					}
				}
				if (collisionSpec.attribute("channel").length() > 0) {
					collision.channel = parseInt(collisionSpec.@channel);
				}
				if (collisionSpec.attribute("role").length() > 0) {
					collision.role = collisionSpec.@role;
				}
				if (collisionSpec.attribute("life").length() > 0) {
					collision.life = parseInt(collisionSpec.@life);
				}
				if (collisionSpec.attribute("points").length() > 0) {
					collision.points = parseInt(collisionSpec.@points);
				}
			}
		}
	}
}