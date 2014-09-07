package objects 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Rocket extends Sprite
	{
		public var rocketMovement : Point = new Point();
		public var rocketDestination : Number;
		public var rocketSpeed : Number = 10; 
			
		private var rocket_Asset:Object_Rocket;
	
		public function Rocket() 
		{
				rocket_Asset = new Object_Rocket();
				addChild(rocket_Asset);
		}
	}

}