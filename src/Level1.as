package
{
	import flash.display.MovieClip;
	import Box2D.Dynamics.Contacts.b2PolygonContact;
	
	import citrus.core.starling.StarlingState;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.objects.platformer.box2d.Sensor;
	import citrus.physics.box2d.Box2D;
	import citrus.utils.objectmakers.ObjectMaker2D;
	
	public class Level1 extends StarlingState
	{
		protected var level:MovieClip;
	
		private var hero:Hero;
		
		public function Level1(_level:MovieClip)
		{
			super();
			level = _level;
			var objectsUsed:Array = [Hero, Platform, Sensor];
		}	
			
		override public function initialize():void{		
			super.initialize()
			
			var physics:Box2D = new Box2D("physics");
			physics.visible = true;
			add(physics);
			
			ObjectMaker2D.FromMovieClip(level);
			
			hero = getObjectByName("hero") as Hero;
			hero.acceleration = 0.2;
			
			var sensorGate:Sensor = getObjectByName("sensorGate") as Sensor;
			sensorGate.onBeginContact.add(sensorGateOnBeginContact);
		}
		
		private function sensorGateOnBeginContact(contact:b2PolygonContact):void
		{		
			trace("Sensor touched");
		}
	}
}