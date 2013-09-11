package screen
{
	import flash.display.MovieClip;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Main extends Sprite
	{
		public var startBtn:Button;
		public var aboutBtn:Button;
		
		public function Main()
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
			
			startBtn = new Button(Assets.getTexture("StartBtn"));
			startBtn.x = 720;
			startBtn.y = 200;
			addChild(startBtn);
			
			aboutBtn = new Button(Assets.getTexture("AboutBtn"));
			aboutBtn.x = 720;
			aboutBtn.y = 300;
			addChild(aboutBtn);
		}
		
		public function destroy() {
			startBtn.removeFromParent(true);
			aboutBtn.removeFromParent(true);
		}
	}
}