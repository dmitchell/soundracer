package sprites
{
	
	import sprites.GameAssets;
	
	public class GameAssets
	{
		
		public static function getClassByFilename( filename : String ) : Class {
			switch(filename)
			{
				case "background.png":
				{
					return LevelSprite;
					break;
				}
				case "background_start.png": { return BackgroundStart; break; }
				case "lives.png": { return LivesSprite; break; }
				case "snake.png": { return SnakeSprite; break; }
				case "penguin.png": { return PenguinSprite; break; }
				case "alligator_sprites.png": { return AlligatorSprite; break; }
				case "car_sprites.png": { return CarSpriteImage; break; }
				case "frog_sprites.png": { return FrogSpriteImage; break; }
				case "bonus_sprites.png": { return HomeSpriteImage; break; }
				case "tree_1.png": { return LogSpriteImage1; break; }
				case "tree_2.png": { return LogSpriteImage2; break; }
				case "tree_3.png": { return LogSpriteImage3; break; }
				case "truck.png": { return TruckSpriteImage; break; }
				case "turtle_2_sprites.png": { return TurtlesSpriteImage; break; }
				case "turtle_3_sprites.png": { return TurtlesBSpriteImage; break; }
					
				case "Blue Dark Penguin.png": { return BlueDarkPenguin; break; }
				case "Blue Light Penguin.png": { return BlueLightPenguin; break; }
				case "Gray Dark Penguin.png": { return GrayDarkPenguin; break; }
				case "Gray Light Penguin.png": { return GrayLightPenguin; break; }
				case "Green Dark Penguin.png": { return GreenDarkPenguin; break; }
				case "Green Light Penguin.png": { return GreenLightPenguin; break; }
				case "Orange Dark Penguin.png": { return OrangeDarkPenguin; break; }
				case "Orange Light Penguin.png": { return OrangeLightPenguin; break; }
				case "Purple Dark Penguin.png": { return PurpleDarkPenguin; break; }
				case "Purple Light Penguin.png": { return PurpleLightPenguin; break; }
				case "Red Dark Penguin.png": { return RedDarkPenguin; break; }
				case "Red Light Penguin.png": { return RedLightPenguin; break; }
				
				case "absbassA.wav": { return absbassA; break;}
				case "absbassC.wav": { return absbassC; break;}
				case "absbassD.wav": { return absbassD; break;}
				case "absbassE.wav": { return absbassE; break;}
				case "absbassG.wav": { return absbassG; break;}
					
				case "crystalA.wav": { return crystalA; break;}
				case "crystalC.wav": { return crystalC; break;}
				case "crystalD.wav": { return crystalD; break;}
				case "crystalE.wav": { return crystalE; break;}
				case "crystalG.wav": { return crystalG; break;}
					
				case "iceA.wav": { return iceA; break;}
				case "iceC.wav": { return iceC; break;}
				case "iceD.wav": { return iceD; break;}
				case "iceE.wav": { return iceE; break;}
				case "iceG.wav": { return iceG; break;}
					
				case "metalloA.wav": { return metalloA; break;}
				case "metalloC.wav": { return metalloC; break;}
				case "metalloD.wav": { return metalloD; break;}
				case "metalloE.wav": { return metalloE; break;}
				case "metalloG.wav": { return metalloG; break;}
					
				case "noiseleadA.wav": { return noiseleadA; break;}
				case "noiseleadC.wav": { return noiseleadC; break;}
				case "noiseleadD.wav": { return noiseleadD; break;}
				case "noiseleadE.wav": { return noiseleadE; break;}
				case "noiseleadG.wav": { return noiseleadG; break;}
					
				case "padA.wav": { return padA; break;}
				case "padC.wav": { return padC; break;}
				case "padD.wav": { return padD; break;}
				case "padE.wav": { return padE; break;}
				case "padG.wav": { return padG; break;}
					
				case "snake.wav": { return snakeSound; break;}
				case "chime.wav": { return chime; break;}
				
				
				default:
				{
					return AlligatorSprite;
					break;
				}
			}
		}
		
		[Embed(source="assets/background.png")]
		public static var LevelSprite:Class;
		
		[Embed(source="assets/lives.png")]
		public static var LivesSprite:Class;
		
		[Embed(source="assets/images/snake.png")]
		public static var SnakeSprite:Class;
		
		[Embed(source="assets/images/penguin.png")]
		public static var PenguinSprite:Class;
		
		[Embed(source="assets/images/Blue Dark Penguin.png")]
		public static var BlueDarkPenguin:Class;
		[Embed(source="assets/images/Blue Light Penguin.png")]
		public static var BlueLightPenguin:Class;
		
		[Embed(source="assets/images/Gray Dark Penguin.png")]
		public static var GrayDarkPenguin:Class;
		[Embed(source="assets/images/Gray Light Penguin.png")]
		public static var GrayLightPenguin:Class;
		
		[Embed(source="assets/images/Green Dark Penguin.png")]
		public static var GreenDarkPenguin:Class;
		[Embed(source="assets/images/Green Light Penguin.png")]
		public static var GreenLightPenguin:Class;
		
		[Embed(source="assets/images/Orange Dark Penguin.png")]
		public static var OrangeDarkPenguin:Class;
		[Embed(source="assets/images/Orange Light Penguin.png")]
		public static var OrangeLightPenguin:Class;
		
		[Embed(source="assets/images/Purple Dark Penguin.png")]
		public static var PurpleDarkPenguin:Class;
		[Embed(source="assets/images/Purple Light Penguin.png")]
		public static var PurpleLightPenguin:Class;
		
		[Embed(source="assets/images/Red Dark Penguin.png")]
		public static var RedDarkPenguin:Class;
		[Embed(source="assets/images/Red Light Penguin.png")]
		public static var RedLightPenguin:Class;
		
		[Embed(source="assets/images/background_plain.png")]
		public static var Background:Class;
		[Embed(source="assets/images/background_start.png")]
		public static var BackgroundStart:Class;
		
		[Embed(source="assets/sounds/soundracerTrack1.mp3")]
		public static var soundracerTrack1:Class;
		
		[Embed(source="assets/Sounds.swf", symbol="absbassA")]
		public static var absbassA:Class;
		
		[Embed(source="assets/Sounds.swf", symbol="absbassC")]
		public static var absbassC: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="absbassD")]
		public static var absbassD: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="absbassE")]
		public static var absbassE: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="absbassG")]
		public static var absbassG: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="crystalA")]
		public static var crystalA: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="crystalC")]
		public static var crystalC: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="crystalD")]
		public static var crystalD: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="crystalE")]
		public static var crystalE: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="crystalG")]
		public static var crystalG: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="iceA")]
		public static var iceA: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="iceC")]
		public static var iceC: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="iceD")]
		public static var iceD: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="iceE")]
		public static var iceE: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="iceG")]
		public static var iceG: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="metalloA")]
		public static var metalloA: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="metalloC")]
		public static var metalloC: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="metalloD")]
		public static var metalloD: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="metalloE")]
		public static var metalloE: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="metalloG")]
		public static var metalloG: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="noiseleadA")]
		public static var noiseleadA: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="noiseleadC")]
		public static var noiseleadC: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="noiseleadD")]
		public static var noiseleadD: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="noiseleadE")]
		public static var noiseleadE: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="noiseleadG")]
		public static var noiseleadG: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="padA")]
		public static var padA: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="padC")]
		public static var padC: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="padD")]
		public static var padD: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="padE")]
		public static var padE: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="padG")]
		public static var padG: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="snakeSound")]
		public static var snakeSound: Class;
		
		[Embed(source="assets/Sounds.swf", symbol="chime")]
		public static var chime:Class;
		
		
		[Embed(source="assets/alligator_sprites.png")]
		public static var AlligatorSprite:Class;
		
		[Embed(source="assets/car_sprites.png")]
		public static var CarSpriteImage:Class;
		
		[Embed(source="assets/frog_sprites.png")]
		public static var FrogSpriteImage:Class;
		
		[Embed(source="assets/bonus_sprites.png")]
		public static var HomeSpriteImage:Class;
		
		[Embed(source="assets/tree_1.png")]
		public static var LogSpriteImage1:Class;
		
		[Embed(source="assets/tree_2.png")]
		public static var LogSpriteImage2:Class;
		
		[Embed(source="assets/tree_3.png")]
		public static var LogSpriteImage3:Class;
		
		[Embed(source="assets/truck.png")]
		public static var TruckSpriteImage:Class;
		
		[Embed(source="assets/turtle_2_sprites.png")]
		public static var TurtlesSpriteImage:Class;
		
		[Embed(source="assets/turtle_3_sprites.png")]
		public static var TurtlesBSpriteImage:Class;
		
	}
}