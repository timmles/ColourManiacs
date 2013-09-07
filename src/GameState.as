package
{
	import Box2D.Dynamics.Contacts.b2Contact;
	
	import citrus.core.CitrusEngine;
	import citrus.core.citrus_internal;
	import citrus.core.starling.StarlingState;
	import citrus.math.MathVector;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.box2d.Box2D;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;

	public class GameState extends StarlingState
	{
		public function GameState()
		{
			super();
		}
		
		override public function initialize():void {
			super.initialize();
			
			var physics:Box2D = new Box2D("box2d");
			physics.visible = true;
			add(physics);
								
			var floor:Platform = new Platform("floot", {x:200, y:748, width: 4000, height:40});
			//floor.view = new Quad(1024, 40, 0x000000);
			add(floor);
			
			var p1:Platform = new Platform("p1", {x:847, y:151, width:300, height:40});
			//p1.view = new Quad(300, 40, 0x000000);
			add(p1);
			
			var mp:MovingPlatform = new MovingPlatform("moving", {x:220, y:720, width:200, height:40, startX:220, startY:700, endX:500, endY:151});
			//mp.view = new Quad(200, 40, 0x000000);
			add(mp);
			
			var hero:Hero = new Hero("hero", {x:50, y:50, width:70, height:70});
			//hero.view = new Giants();
			add(hero);
			
			var enemy:Enemy = new Enemy("enemy", {x:900, y:700, width:70, height:70, leftBound:10, rightBound:1000});
			//enemy.view = new Tigers();
			add(enemy);
			
			var goal:Coin = new Coin("ring", {x:967, y:90, width:79, height:79});
			goal.onBeginContact.add(function(c:b2Contact):void {
				trace("Giants Win!");
			});
			//goal.view = new Ring();
			add(goal);
			
			view.camera.setUp(hero, new Point((stage.width-35)*.5, (stage.height-35)*.5), new Rectangle(-2000, -stage.height*.9, 4000, 1500), new Point(.35, .4));
		}
	}
}