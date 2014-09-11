package objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
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
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// Entry Point
			
		}
		
		public function checkPosition(_rockets:Array, _rocket:Rocket, mouseLocation:int):void 
		{
			if (_rocket.y <= mouseLocation)
			{
				parent.removeChild(_rocket);
				_rockets.splice(_rocket, 1);
			}
		}
		
		
		
	}

}