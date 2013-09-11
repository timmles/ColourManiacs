package actor
{
	import Box2D.Dynamics.Contacts.b2Contact;
	
	import citrus.objects.platformer.box2d.Sensor;
	
	import screen.MenuState;
	
	public class Finish extends Sensor
	{
		public function Finish(name:String, params:Object=null)
		{
			super(name, params);
			
			view = Assets.getTexture("Finish");
		}
		
		override public function handleBeginContact(contact:b2Contact):void {
			onBeginContact.dispatch(contact);
			var ms:MenuState = new MenuState();
			ms.initialize();
			_ce.state = ms;
		}
	}
}