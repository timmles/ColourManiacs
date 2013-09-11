package screen
{
	import flash.display.MovieClip;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Start extends Sprite
	{
		public var backBtn:Button;
		public var tutorialBtn:Button;
		public var easyBtn:Button;
		public var hardBtn:Button;
		
		public function Start()
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
			
			backBtn = new Button(Assets.getTexture("BackBtn"));
			backBtn.x = 720;
			backBtn.y = 10;
			addChild(backBtn);
			
			tutorialBtn = new Button(Assets.getTexture("TutorialBtn"));
			tutorialBtn.x = 355;
			tutorialBtn.y = 200;
			addChild(tutorialBtn);
			
			easyBtn = new Button(Assets.getTexture("EasyBtn"));
			easyBtn.x = 355;
			easyBtn.y = 300;
			addChild(easyBtn);
			
			/*hardBtn = new Button(Assets.getTexture("HardBtn"));
			hardBtn.x = 355;
			hardBtn.y = 400;
			addChild(hardBtn);*/
		}
	}
}