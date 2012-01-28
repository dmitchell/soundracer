package model
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;

	public class Game
	{
		public var lapDuration : int;
		public var lapTimer : Timer;
		public var life : int = 10;
		public var score : int = 0;
		
		public var musicManager : MusicManager;
		public var pieceLibrary : PieceLibrary;
		public var placedPieces : ArrayCollection = new ArrayCollection();
		
		public static const MUSIC_XML_NAME : String = "game_music";
		
		public function Game(musicConfigFilename : String, gameConfigFilename : String)
		{
			var urlReq : URLRequest = new URLRequest(musicConfigFilename);
			urlReq.contentType = "application/xml";
			
			var musicConfigFile : URLLoader = new URLLoader(urlReq);
			musicConfigFile.addEventListener(Event.COMPLETE, processConfig);
			
			urlReq = new URLRequest(gameConfigFilename);
			
			var gameConfigFile : URLLoader = new URLLoader(urlReq);
			gameConfigFile.addEventListener(Event.COMPLETE, processConfig);
			
		}
		
		private function processConfig(event : Event) : void {
			var configXml : XML = new XML(event.target.data);
			if (String(configXml.name().localName).toLowerCase() == 
		}
	}
}