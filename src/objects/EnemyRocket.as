package objects 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class EnemyRocket extends gObject
	{
		private var rocketSpeed:uint = 7;
		
		public static const REMOVE_ROCKET : String = "remove_rocket";
		public function EnemyRocket() 
		{
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			graphics.beginFill(0x0000ff, 2);
			graphics.drawRect(0, 0, 20, 10);
			graphics.endFill();
			
			this.x = -this.width / 2;
			this.y = -this.height / 2;
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			moveRocket();
			checkPosition();
			checkCollision();
		}
		
		private function checkCollision():void 
		{
			for each(var explosion:Explosion in ExplosionManager.explosions)
			{
				if (this.hitTestObject(explosion))
				{
					dispatchEvent(new Event(REMOVE_ROCKET, true));
				}
			}
		}
		
		private function checkPosition():void 
		{
			if (this.y >= 570)
			{
				dispatchEvent(new Event(REMOVE_ROCKET, true));
			}
		}
		
		private function moveRocket():void
		{
			var angle:Number = this.rotation,
				radion:Number = angle / (180 / Math.PI),
				moveX:Number = Math.cos (radion) * rocketSpeed,
				moveY:Number = Math.sin (radion) * rocketSpeed;
					
			this.x += moveX;
			this.y += moveY;
		}
		
	}

}