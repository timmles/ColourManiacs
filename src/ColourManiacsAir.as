package
{
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.physics.PhysicsCollisionCategories;
	
	import screen.MenuState;
	
	[SWF(frameRate="60",width="960",height="540")]
	public class ColourManiacsAir extends StarlingCitrusEngine
	{
		public function ColourManiacsAir()
		{
			setUpStarling();
			initGame();
			state = new MenuState();
		}
		
		private function initGame():void {
			PhysicsCollisionCategories.Add("ColourPlatforms");
			PhysicsCollisionCategories.Add("ColourBalls");
			
			
		}
	}
}