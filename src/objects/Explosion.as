package objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Explosion extends gObject
	{
		private var maxSize:Boolean = false;
		private var speed:Number = 1.5;
		private var maxSizeNumber:Number = 20;
		public static const GROW_COMPLETE : String = "grow_complete";
		
		public function Explosion() 
		{
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			graphics.beginFill(0xff4500);
			graphics.drawCircle(0, 0, 5);
			graphics.endFill();
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			grow();
			shrink();
		}
		
		private function grow():void 
		{
			if (maxSize == false)
			{
				this.scaleX += speed;
				this.scaleY += speed;
			}
			
			if (this.scaleX >= maxSizeNumber && this.scaleY >= maxSizeNumber)
			{
				maxSize = true;
			}
		}
		
		private function shrink():void 
		{
			if (maxSize == true)
			{
				this.scaleX -= speed;
				this.scaleY -= speed;
			}
			if (this.scaleX <= 0 && this.scaleY <= 0)
			{
				dispatchEvent(new Event(GROW_COMPLETE, true));
			}
		}
		
		
	}

}