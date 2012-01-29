package model
{
	import flash.media.AudioDecoder;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	import org.flixel.FlxG;
	
	import sprites.GameAssets;

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
				if (tracks[i]) {
					(tracks[i] as Sound).play(0,99);	
				}
			}
		}
		
		public function stopMusic():void{
			for(var i:int = 0; i < 32; i++)
			{
				if (tracks[i]) {
					var s:Sound = tracks[i];
					s.close();
				}
			}
		}
	}
}