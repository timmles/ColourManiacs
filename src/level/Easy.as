package level
{
	import flash.display.MovieClip;
	
	public class Easy extends ColourManiacsLevel
	{
		public function Easy(_levelSWF:MovieClip)
		{
			super(_levelSWF);
		}	
		
		override public function initialize():void{		
			super.initialize();
		}
	}
}

/*package level
{
	import Box2D.Dynamics.Contacts.b2Contact;
	
	import citrus.core.CitrusEngine;
	import citrus.core.citrus_internal;
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.core.starling.StarlingState;
	import citrus.math.MathVector;
	import citrus.objects.CitrusSprite;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.Missile;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.box2d.Box2D;
	
	import feathers.layout.ViewPortBounds;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import actor.ColourBall;
	import actor.ColourPlatform;
	
	import starling.core.Starling;
	import starling.core.starling_internal;
	import starling.display.Image;
	import starling.textures.Texture;
	import actor.Blob;

	public class Easy extends StarlingState
	{
		private const viewport:Point = new Point(960, 540);
		private var _bounds:Rectangle = new Rectangle(-2000, (-viewport.y)*1.3, 4000, 1500);
		
		private var _blob:Blob;
		
		public function Easy()
		{
			super();
		}
		
		override public function initialize():void {
			super.initialize();
			
			var physics:Box2D = new Box2D("box2d");
			physics.visible = true;
			add(physics);
			
			var floor:Platform = new Platform("floor", {x:200, y:748, width: 4000, height:40});
			//floor.view = new Quad(1024, 40, 0x000000);
			
			add(floor);
			
			var colour:ColourPlatform = new ColourPlatform("colour", {x:0, y:600});
			//floor.view = new Quad(1024, 40, 0x000000);
			add(colour);
			
			var p1:Platform = new Platform("p1", {x:847, y:151, width:300, height:40});
			//p1.view = new Quad(300, 40, 0x000000);
			add(p1);
			
			var mp:MovingPlatform = new MovingPlatform("moving", {x:220, y:720, width:200, height:40, startX:220, startY:700, endX:500, endY:151});
			//mp.view = new Quad(200, 40, 0x000000);
			add(mp);
			
			_blob = new Blob("hero", {x:50, y:50, width:70, height:70});
			//hero.view = new Giants();
			add(_blob);
			
			var enemy:Enemy = new Enemy("enemy", {x:900, y:700, width:70, height:70, leftBound:10, rightBound:1000});
			//enemy.view = new Tigers();
			add(enemy);
			
			var goal:Coin = new Coin("ring", {x:967, y:90, width:79, height:79});
			goal.onBeginContact.add(function(c:b2Contact):void {
				colour.makeActive();
			});
			//goal.view = new Ring();
			add(goal);
			
			//var _clouds:Vector.<CitrusSprite> = new Vector.<CitrusSprite>();
			
			var cloud:CitrusSprite;
			var cloudIMG:Image;
			var i:uint;
			var total:uint = 20;
			for (i = 0; i < total; i++)
			{
				cloudIMG = Image.fromBitmap(new Assets.Cloud());								//get image
				cloudIMG.scaleX = cloudIMG.scaleY = (i / total + 0.5);							//scale up or down relative to positon in the array
				cloudIMG.scaleX *= (Math.random() <= 0.5) ? -1 : 1;								//move with or against player direction
				cloud = new CitrusSprite("cloud" + String(i), {view: cloudIMG, group: i});		//create sprite
				cloud.x = Math.random() * _bounds.width;										//set random x
				cloud.y = Math.random() * 3 * _bounds.height / 4;								//set random y
				cloud.parallaxX = cloud.parallaxY = (i / total) / 3 + 1;						//define parallax values, which allows Citrus to control parallax
				//_clouds.push(cloud);
				add(cloud);
			}
			
			view.camera.setUp(_blob);//,  new Point((viewport.x-35)*.5, (viewport.y-35)*.5), _bounds, new Point(.35, .4));
			_ce.stage.addEventListener(MouseEvent.CLICK, _throwBall);
			
		}
		
		private function _throwBall(evt:MouseEvent):void
		{
			var ball:ColourBall = new ColourBall("colourBall", {
					x: _blob.x,
					y: _blob.y,
					mouseX: view.camera.camPos.x*-1 + evt.stageX,
					mouseY: view.camera.camPos.y*-1 + evt.stageY
				});
			add(ball);
		}
	}
}*/