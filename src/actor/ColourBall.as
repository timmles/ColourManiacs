package actor
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2Body;
	
	import citrus.objects.platformer.box2d.Missile;
	import citrus.physics.PhysicsCollisionCategories;
	import citrus.physics.box2d.Box2DShapeMaker;
	import citrus.physics.box2d.Box2DUtils;
	
	public class ColourBall extends Missile
	{
		//this prevents a warning that those paramaters don't exist
		[Inspectable(defaultValue="0")]
		public var mouseX:Number = 0;
		
		[Inspectable(defaultValue="0")]
		public var mouseY:Number = 0;
		
		public function ColourBall(name:String, params:Object=null)
		{
			updateCallEnabled = true;

			params.width = 40;
			params.height = 40;
			params.speed = 10;
			params.angle = _fireAngle(params.x, params.y, params.mouseX, params.mouseY);
			params.fuseDuration = 1000
			
			super(name, params);
			
			view = Assets.getTexture("Ball");;
		}
		
		override protected function createShape():void {
			_shape = Box2DShapeMaker.Circle(_width, _height);
		}
		
		override protected function defineFixture():void
		{
			super.defineFixture();
			_fixtureDef.filter.categoryBits = PhysicsCollisionCategories.Get("ColourBalls");
			_fixtureDef.filter.maskBits = PhysicsCollisionCategories.GetAllExcept("GoodGuys");
		}
		
		override public function handleBeginContact(contact:b2Contact):void {
			_contact = Box2DUtils.CollisionGetOther(this, contact);
			explode();
			
			if (_contact is ColourPlatform) {
				(_contact as ColourPlatform).impact();
			}
		}
		
		override public function explode():void {
			super.explode();
			visible = false;
		}
		
		private function _fireAngle(x:Number, y:Number, mouseX:Number, mouseY:Number):Number {
			var deltaX:Number = x - mouseX;											//determine x diff
			var deltaY:Number = y - mouseY;											//determine x diff
			var fireAngle:Number = Math.atan2(deltaY, deltaX) * 180 / Math.PI;				//trigonometry to calculate 
			return fireAngle + 180;													//rotate fire angle by 180
		}
	}
}