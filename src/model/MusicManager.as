package model
{
	import flash.media.Sound;
	import flash.net.URLRequest;

	public class MusicManager
	{
		public var tracks : Array = new Array(32);
		
		
		public function MusicManager(configXml : XML)
		{
			for each (var track : XML in configXml.track) {
				var loadedSound : Sound = new Sound(new URLRequest("sound/" + track.@audio));
				var channel : int = parseInt(track.channel);
				
				tracks[channel] = loadedSound;
			}
		}
	}
}