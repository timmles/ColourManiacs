package actor
{
	import citrus.objects.platformer.box2d.Hero;
	
	public class Blob extends Hero
	{
		public function Blob(name:String, params:Object=null)
		{
			params.width = 63;
			params.height = 70;
			super(name, params);
			view = Assets.getTexture("Blob");
		}
	}
}