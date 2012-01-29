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
				case "Orange DarkPenguin.png": { return OrangeDarkPenguin; break; }
				case "Orange LightPenguin.png": { return OrangeLightPenguin; break; }
				case "Purple Dark Penguin.png": { return PurpleDarkPenguin; break; }
				case "Purple Light Penguin.png": { return PurpleLightPenguin; break; }
				case "Red Dark Penguin.png": { return RedDarkPenguin; break; }
				case "Red Light Penguin.png": { return RedLightPenguin; break; }
				
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