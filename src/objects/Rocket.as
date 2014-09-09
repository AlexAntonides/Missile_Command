package objects 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Rocket extends pObject
	{
		private var rocket_Asset:Object_Rocket;
	
		public function Rocket() 
		{
				rocket_Asset = new Object_Rocket();
				addChild(rocket_Asset);
		}
	}

}