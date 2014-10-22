package objects 
{
	import flash.events.MouseEvent;
	import ginterface.SoundManager;
	import utils.Vector2D;
	import flash.events.Event;
	import objects.gObject;
	import assets.Assets;
	import objects.Rocket;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Tower extends gObject
	{
		public var ammo : int = 10;
		public var totalAmmo : int;
		
		private var _maxAmmo : int = 30;
		private var _sManager:SoundManager = new SoundManager;
		private var _mousePos : Vector2D = new Vector2D();
		private var stop:Boolean = false;
		public function Tower() 
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
			graphics.drawRect(0, -5, 30, 10);
			graphics.endFill();
			
			totalAmmo = ammo;
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveTurret);
			stage.addEventListener(Event.ENTER_FRAME, check);
		}
		
		private function check(e:Event):void 
		{
			if (ammo == Math.round(totalAmmo / 3) && stop == false)
			{
				_sManager.playSound(_sManager.SOUND_LOA);
				stop = true;
			}
		}
		
		private function moveTurret(e:MouseEvent):void 
		{
			this.rotation = 0;
			_mousePos.x = this.mouseX;
			_mousePos.y = this.mouseY;
			this.rotation = _mousePos.angle * 180 / Math.PI;
		}
		
	}

}