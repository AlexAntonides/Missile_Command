package objects 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Car extends gObject 
	{
		private var _direction:int = 1;
		public function Car() 
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
			graphics.drawRect(0, -5, 20, 20);
			graphics.endFill();
			
			addEventListener(Event.ENTER_FRAME, randomMovement);
		}
		
		private function randomMovement(e:Event):void 
		{
			if (this.x >= stage.stageWidth)
			{
				this.x = stage.stageWidth - stage.stageWidth;
			}
			this.x += _direction;
		}
		
	}

}