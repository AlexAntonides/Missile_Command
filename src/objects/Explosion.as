package objects 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.ColorTransform;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Explosion extends gObject
	{
		private var maxSize:Boolean = false;
		private var speed:Number = 0.7;
		private var maxSizeNumber:Number = 15;
		public static const GROW_COMPLETE : String = "grow_complete";
		public static const ROCKET_REMOVE : String = "rocket_remove";
		private var explosion:Sprite = new Sprite();
		
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
			
			explosion.graphics.beginFill(0xff4500);
			explosion.graphics.drawCircle(0, 0, 5);
			explosion.graphics.endFill();
			
			addChild(explosion);
			
			var timer:Timer = new Timer(0, 0);
			timer.addEventListener(TimerEvent.TIMER, changeColor);
			timer.start();
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			grow();
			shrink();
		}
		
		private function changeColor(e:TimerEvent):void 
		{
			var randomNumber:int = Math.floor(Math.random() * 7);
			var cColor:ColorTransform = new ColorTransform();
			
			if (randomNumber == 1)
			{
				cColor.color = 0xFF0000;
			}
			else if (randomNumber == 2)
			{
				cColor.color = 0x00FF00;
			}
			else if (randomNumber == 3)
			{
				cColor.color = 0x0000FF;
			}
			else if (randomNumber == 4)
			{
				cColor.color = 0xFF00FF;
			}
			else if (randomNumber == 5)
			{
				cColor.color = 0xFFFF00;
			}
			else if (randomNumber == 6)
			{
				cColor.color = 0x00FFFF;
			}
			else
			{
				cColor.color = 0x000000;
			}
			
			
			explosion.transform.colorTransform = cColor;
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