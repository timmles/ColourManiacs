package screen
{
	import flash.display.MovieClip;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class About extends Sprite
	{
		public var backBtn:Button;
		
		public function About()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			this.visible = true;
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			var bg:Image = new Image(Assets.getTexture("Background"));
			bg.x = 0;
			bg.y = 0;
			addChild(bg);
			
			var title:Image = new Image(Assets.getTexture("Title"));
			title.x = 20;
			title.y = 10;
			addChild(title);
			
			var modal:Image = new Image(Assets.getTexture("Modal"));
			modal.x = 40;
			modal.y = 150;
			addChild(modal);
			
			backBtn = new Button(Assets.getTexture("BackBtn"));
			backBtn.x = 720;
			backBtn.y = 10;
			addChild(backBtn);

			var heading:TextField = new TextField(820, 150, "Information Design\n Serious Game", "Arial", 26, Color.WHITE);
			heading.x = 70;
			heading.y = 170;
			heading.hAlign = HAlign.CENTER;  // horizontal alignment
			heading.vAlign = VAlign.TOP; // vertical alignment
			heading.border = false;
			addChild(heading);
			
			var body:TextField = new TextField(820, 250, "Gerhard Klopper\n George Mass\n Tim Lewis\n Pieter Kruger", "Arial", 18, Color.WHITE);
			body.x = 70;
			body.y = 270;
			body.hAlign = HAlign.CENTER;  // horizontal alignment
			body.vAlign = VAlign.TOP; // vertical alignment
			body.border = false;
			addChild(body);
		}
	}
}