package actor
{
	import citrus.objects.platformer.box2d.Platform;
	
	import starling.display.Quad;

	public class StylePlatform extends Platform
	{
		public function StylePlatform(name:String, params:Object=null)	{
			super(name, params);
			view = new Quad(width, height, 0x252525);
		}
		
		
	}
}