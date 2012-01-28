package model
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class PieceLibrary
	{
		public var library : Array = new Array();
		
		public function PieceLibrary(configXml : XML)
		{
			for (var i : int = 0; i < configXml.child("collision_obj").length(); i++) {
				var collision : CollisionObj = new CollisionObj();
				var collisionSpec : XML = configXml.collision_obj[i];
				
				library[i] = collision;
				trace(collisionSpec.attribute("image"));
				if (collisionSpec.attribute("image").length() > 0) {
					var imageLoader :Loader = new Loader();
					imageLoader.load(new URLRequest("images/" + collisionSpec.@image));
					collision.onImage = imageLoader;
				}
				if (collisionSpec.attribute("off_image").length() > 0) {
					var imageLoader2 :Loader = new Loader();
					imageLoader2.load(new URLRequest("images/" + collisionSpec.@off_image));
					collision.offImage = imageLoader;
				}
				if (collisionSpec.attribute("audio").length() > 0) {
					collision.audio = new Sound(new URLRequest("sound/" + collisionSpec.@audio));
				}
				if (collisionSpec.attribute("channel").length() > 0) {
					collision.channel = parseInt(collisionSpec.@channel);
				}
				if (collisionSpec.attribute("role").length() > 0) {
					collision.role = collisionSpec.@role;
				}
				if (collisionSpec.attribute("life").length() > 0) {
					collision.channel = parseInt(collisionSpec.@life);
				}
				if (collisionSpec.attribute("points").length() > 0) {
					collision.channel = parseInt(collisionSpec.@points);
				}
			}
		}
	}
}