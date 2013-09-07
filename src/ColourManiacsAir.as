package
{
	import citrus.core.starling.StarlingCitrusEngine;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	[SWF(frameRate="60",width="960",height="540")]
	public class ColourManiacsAir extends StarlingCitrusEngine
	{
		public function ColourManiacsAir()
		{
		setUpStarling();
			var loader:Loader = new Loader();
			//loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _levelLoaded);
			//loader.load(new URLRequest("levels/Level1.swf"));
			state = new GameState();
		}
		
		private function _levelLoaded(evt:Event):void {
			state = new Level1(evt.target.loader.content);
			evt.target.removeEventListener(Event.COMPLETE, _levelLoaded);
			evt.target.loader.unloadAndStop();
		}
	}
}