package objects {
	import flash.display.Stage;
	import flash.events.Event;
	import screens.GameScreen;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Rocket extends gObject
	{
		public static const REACHED_LOCATION : String = "reached_location";
		private var mouseLocation:Number = TowerManager._Ymouse; 
		
		private var speed:int = 10;
		
		public function Rocket() 
		{
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			graphics.beginFill(0x000000, 1);
			graphics.drawRect(0, 0, 10, 10);
			graphics.endFill();
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			moveRocket();
			checkPosition();
		}
		
		private function moveRocket():void
		{
			var angle:Number = this.rotation, // Kan ook aan het begin ipv elke frame het berekenen
				radion:Number = angle / (180 / Math.PI),
				moveX:Number = Math.cos (radion) * speed,
				moveY:Number = Math.sin (radion) * speed;
					
			this.x += moveX;
			this.y += moveY;
		}
		
		private function checkPosition():void
		{
			if (this.y <= mouseLocation)
			{
				dispatchEvent(new Event(REACHED_LOCATION, true));
			}
		}
	}

}