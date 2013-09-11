package 
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;

	public class Assets
	{
		[Embed(source="art/blob.png")]
		public static const Blob:Class;
		
		[Embed(source="art/ball.png")]
		public static const Ball:Class;
		
		[Embed(source = "art/cloud1.png")]
		public static const Cloud:Class;
		
		[Embed(source = "art/finish1.png")]
		public static const Finish:Class;
		
		[Embed(source = "art/bg.png")]
		public static const Background:Class;
		
		[Embed(source = "art/title.png")]
		public static const Title:Class;
		
		[Embed(source = "art/modal.png")]
		public static const Modal:Class;
		
		[Embed(source = "art/start.png")]
		public static const StartBtn:Class;
		
		[Embed(source = "art/about.png")]
		public static const AboutBtn:Class;
		
		[Embed(source = "art/back.png")]
		public static const BackBtn:Class;
		
		[Embed(source = "art/tutorial.png")]
		public static const TutorialBtn:Class;
		
		[Embed(source = "art/easy.png")]
		public static const EasyBtn:Class;
		
		[Embed(source = "art/hard.png")]
		public static const HardBtn:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):Texture {
			if (gameTextures[name] == undefined) {
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
	}
}