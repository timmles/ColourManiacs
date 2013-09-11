package level
{
	import actor.Blob;
	import actor.ColourBall;
	import actor.Finish;
	import actor.StylePlatform;
	
	import citrus.core.starling.StarlingState;
	import citrus.input.controllers.Keyboard;
	import citrus.objects.CitrusSprite;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.box2d.Box2D;
	import citrus.utils.objectmakers.ObjectMaker2D;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import screen.MenuState;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class ColourManiacsLevel extends StarlingState
	{
		private var blob:Blob;
		protected var levelSWF:MovieClip;
		private const viewport:Point = new Point(960, 540);
		private var _bounds:Rectangle = new Rectangle(-2000, (-viewport.y)*1.3, 4000, 1500);
		
		public function ColourManiacsLevel(_levelSWF:MovieClip)
		{
			super();
			levelSWF = _levelSWF;
			Finish;
		}	
		
		override public function initialize():void{		
			super.initialize();
			add(new CitrusSprite("background", { x:0, y:0, view:new GameBackground(_bounds.width, _bounds.height), touchable:false } ));
			var physics:Box2D = new Box2D("physics");
			//physics.visible = true;
			add(physics);
			
			ObjectMaker2D.FromMovieClip(levelSWF);
			
			blob = getObjectByName("blob") as Blob; //init blob so that camera can follow
			var floor:StylePlatform = getObjectByName("floor") as StylePlatform; //init blob so that camera can follow
			
			view.camera.setUp(blob, new Point((viewport.x-35)*.5, (viewport.y-35)*.5), new Rectangle(-2000, floor.y-(viewport.y*2.4), 4000, floor.y+(viewport.y*1.8)), new Point(.35, .4));
			_ce.stage.addEventListener(MouseEvent.CLICK, _throwBall);
			_ce.stage.addEventListener(KeyboardEvent.KEY_DOWN, test);
			_ce.stage.addEventListener(KeyboardEvent.KEY_DOWN, test);
			_ce.stage.addEventListener(KeyboardEvent.KEY_DOWN, test);
		}
		
		private function test(evt:KeyboardEvent) {
			if (evt.keyCode == Keyboard.B) {
				GameConfig.shotColour = ColorSpectrum.BLUE;
			} else if (evt.keyCode == Keyboard.R) {
				GameConfig.shotColour = ColorSpectrum.RED;
			} else if (evt.keyCode == Keyboard.Y) {
				GameConfig.shotColour = ColorSpectrum.YELLOW;
			} else if (evt.keyCode == Keyboard.BACKSPACE) {
				var ms:MenuState = new MenuState();
				ms.initialize();
				_ce.state = ms;
			}
		}
		
		private function _throwBall(evt:MouseEvent):void
		{
			var ball:ColourBall = new ColourBall("colourBall", {
				x: blob.x,
				y: blob.y,
				mouseX: view.camera.camPos.x*-1 + evt.stageX,
				mouseY: view.camera.camPos.y*-1 + evt.stageY
			});
			add(ball);
		}
	}
}