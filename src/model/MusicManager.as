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
				var loadedSound : Sound = new Sound(new URLRequest("sounds/" + track.@audio));
				var channel : int = parseInt(track.channel);
				
				tracks[channel] = loadedSound;
			}
		}
		
		public function play():void
		{
			for(var i:int = 0; i < 32; i++)
			{
				tracks[i].play(0,9);	
			}
		}
	}
}