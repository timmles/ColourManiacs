package actor
{
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2FilterData;
	
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.PhysicsCollisionCategories;
	
	import flash.display.Shape;
	
	import starling.display.Quad;
	import starling.display.QuadBatch;
	
	public class ColourPlatform extends Platform
	{
		private var _active:Boolean = false;
		private var blockColor:ComplexColor = ColorMixer.initRandomColor(GameConfig.gameLevel);
		private var blockState:int = 0;
		private var blockColours:Array = new Array();
		
		public function ColourPlatform(name:String, params:Object=null)
		{
			/*params.width = 70;
			params.height = 70;*/
			
			super(name, params);
			
			var roundRect:Shape = new Shape();
			roundRect.graphics.lineStyle(3, 0xCCFF00);
			roundRect.graphics.beginFill(0x006600, 1);
			roundRect.graphics.drawRoundRect(25, 255, 175, 75, 25, 25);
			roundRect.graphics.endFill();
			
			view = buildQuad();
			
			trace(blockColor.getHex());
		}
		
		private function buildQuad():QuadBatch {
			var result:QuadBatch = new QuadBatch();
			var borderWidth:uint = width/10;
			
			if(blockState == 0) {
				result.addQuad(new Quad(width, height, (GameConfig.gameLevel == 2)?0xCCCCCC:0xFFFFFF));
			} else if (blockState == 1) {
				var border:Quad = new Quad(width, height, blockColor.getHex());
				result.addQuad(border);
				
				var subWidth:Number = (this.width - borderWidth*2)/GameConfig.gameLevel;
				
				for(var i:uint = 0; i < GameConfig.gameLevel; i++) {
					var subQuad:Quad = new Quad(subWidth, height - borderWidth*2, (blockColours[i] != null)?blockColours[i]:0xFFFFFF);
					subQuad.x = subWidth*(i) + borderWidth;
					subQuad.y = borderWidth;
					result.addQuad(subQuad);
				}
			} else {
				result.addQuad(new Quad(width, height, blockColor.getHex()));
			}
			
			return result;
		}
		
		override protected function defineFixture():void
		{
			super.defineFixture();
			_fixtureDef.filter.categoryBits = PhysicsCollisionCategories.Get("ColourPlatforms");
			_fixtureDef.filter.maskBits = PhysicsCollisionCategories.Get("ColourBalls");
		}
		
		public function impact():void {
			var shotColor:uint = GameConfig.shotColour;
			switch(blockState) {
				case 0:	//invisible
					var filter:b2FilterData = _fixture.GetFilterData();
					filter.maskBits = PhysicsCollisionCategories.GetAll();
					_fixture.SetFilterData(filter);
					blockState += 1;
					this.view = buildQuad();
				case 1: //one fill
					if(blockColor.addColor(shotColor)) {
						if(blockColor.countRemainingColors() == 0) {
							blockState += 1;
						}
						blockColours.push(shotColor);
						this.view = buildQuad();
					}
					break;
				case 2: //filled
					//do nothing
					break;
			}
		}
	}
}