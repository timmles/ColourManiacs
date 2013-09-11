package screen
{
	import citrus.core.starling.StarlingState;
	import citrus.objects.CitrusSprite;
	import citrus.view.starlingview.StarlingCamera;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.utils.getDefinitionByName;
	
	import level.Easy;
	import level.Tutorial;
	
	import starling.events.Event;

	public class MenuState extends StarlingState
	{
		private var _mainMenu:Main;
		private var mainSprite:CitrusSprite
		
		private var _startMenu:Start;
		private var startSprite:CitrusSprite
		
		private var _aboutMenu:About;
		private var aboutSprite:CitrusSprite
		
		private var _camera:StarlingCamera;
		
		private var url:String, className:String;
		
		public function MenuState()
		{
			super();
			Tutorial; Easy;
		}
		
		override public function initialize():void
		{
			super.initialize();
			initMain();
			_camera = view.camera.setUp(null, null, null, null, new Point(960, 540)) as StarlingCamera;
		}
		
		private function initMain():void {
			_mainMenu = new Main();
			mainSprite = new CitrusSprite("main", { x:0, y:0 , view:_mainMenu, touchable:true } );
			add(mainSprite);
			
			trace(_mainMenu.startBtn);
			
			_mainMenu.startBtn.addEventListener(starling.events.Event.TRIGGERED, gotoStart);
			_mainMenu.aboutBtn.addEventListener(starling.events.Event.TRIGGERED, gotoAbout);
		}
		
		private function initStart():void {
			_startMenu = new Start();
			startSprite = new CitrusSprite("main", { x:0, y:0 , view:_startMenu, touchable:true } );
			add(startSprite);
			
			_startMenu.backBtn.addEventListener(starling.events.Event.TRIGGERED, gotoMainFromStart);
			_startMenu.tutorialBtn.addEventListener(starling.events.Event.TRIGGERED, gotoTutorial);
			_startMenu.easyBtn.addEventListener(starling.events.Event.TRIGGERED, gotoEasy);
			//_startMenu.hardBtn.addEventListener(starling.events.Event.TRIGGERED, gotoHard);
		}
		
		private function initAbout():void {
			_aboutMenu = new About();
			aboutSprite = new CitrusSprite("main", { x:0, y:0 , view:_aboutMenu, touchable:true } );
			add(aboutSprite);
			
			_aboutMenu.backBtn.addEventListener(starling.events.Event.TRIGGERED, gotoMainFromAbout);
		}
		
		private function initTutorial():void {
			url = "level/Tutorial.swf";
			className = "level.Tutorial";
			_loadThisLevel();
		}
		
		private function initEasy():void {
			url = "level/Easy.swf";
			className = "level.Easy";
			_loadThisLevel();
		}
		
		private function initHard():void {
			url = "level/Hard.swf";
			className = "level.Hard";
			_loadThisLevel();
		}
		
		private function destroyMain():void {
			remove(mainSprite);
			_mainMenu.startBtn.removeEventListener(starling.events.Event.TRIGGERED, gotoStart);
			_mainMenu.aboutBtn.removeEventListener(starling.events.Event.TRIGGERED, gotoAbout);
			_mainMenu.destroy();
			_mainMenu = null;
			mainSprite = null;
		}
		
		private function destroyStart():void {
			remove(startSprite);
			_startMenu.backBtn.removeEventListener(starling.events.Event.TRIGGERED, gotoMainFromStart);
			_startMenu.tutorialBtn.removeEventListener(starling.events.Event.TRIGGERED, gotoTutorial);
			_startMenu.easyBtn.removeEventListener(starling.events.Event.TRIGGERED, gotoEasy);
			//_startMenu.hardBtn.removeEventListener(starling.events.Event.TRIGGERED, gotoHard);
		}
		
		private function destroyAbout():void {
			remove(aboutSprite);
			_aboutMenu.backBtn.removeEventListener(starling.events.Event.TRIGGERED, gotoMainFromAbout);
		}
		
		public function gotoStart():void
		{
			destroyMain();
			initStart();
		}
		
		public function gotoAbout():void
		{
			destroyMain();
			initAbout();
		}
		
		public function gotoMainFromAbout():void
		{
			destroyAbout();
			initMain();
		}
		
		public function gotoMainFromStart():void
		{
			destroyStart();
			initMain();
		}
		
		public function gotoTutorial():void
		{
			destroyStart();
			initTutorial();
		}
		
		public function gotoEasy():void
		{
			destroyStart();
			initEasy();
		}
		
		public function gotoHard():void
		{
			remove(startSprite);
			initHard();
		}
		
		private function _loadThisLevel():void {
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, _levelLoaded);
			loader.load(new URLRequest(url));
		}
		
		private function _levelLoaded(evt:flash.events.Event):void {
			var ClassReference:Class = getDefinitionByName(className) as Class;
			_ce.state = new ClassReference(evt.target.loader.content);
			evt.target.removeEventListener(flash.events.Event.COMPLETE, _levelLoaded);
			evt.target.loader.unloadAndStop();
		}
	}
}