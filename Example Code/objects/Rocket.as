package objects 
{
	import effects.Explosion;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
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
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// Entry Point
			
		}
		
		public function checkPosition(rocket:gObject, rockets:Array, Xmouse:int, Ymouse:int, stage:Stage)
		{
			if (rocket.y <= Ymouse)
			{
				rocket.createExplosion(stage, Xmouse, Ymouse); 
			}
		}
		
	}

}