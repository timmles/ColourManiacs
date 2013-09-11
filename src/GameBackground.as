package 
{
	import citrus.objects.CitrusSprite;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class GameBackground extends Sprite
	{
		public function GameBackground(boundsWidth, boundsHeight)
		{
			super();
			
			//var cloud:CitrusSprite;
			var cloud:Image;
			var i:uint;
			var total:uint = 20;
			for (i = 0; i < total; i++)
			{
				cloud = new Image(Assets.getTexture("Cloud"));								//get image
				cloud.scaleX = cloud.scaleY = (i / total + 0.5);							//scale up or down relative to positon in the array
				cloud.scaleX *= (Math.random() <= 0.5) ? -1 : 1;								//move with or against player direction
				//cloud = new CitrusSprite("cloud" + String(i), {view: cloudIMG, group: 0});		//create sprite
				cloud.x = Math.random() * boundsWidth;										//set random x
				cloud.y = Math.random() * 3 * boundsHeight / 4;								//set random y
				//cloud.parallaxX = cloud.parallaxY = (i / total) / 3 + 1;						//define parallax values, which allows Citrus to control parallax
				//_clouds.push(cloud);
				addChild(cloud);
			}
		}
	}
}