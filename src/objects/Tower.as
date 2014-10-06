package objects 
{
	import flash.events.MouseEvent;
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
		public var ammo : int = 30;
		
		private var _maxAmmo : int = 30;
		private var _mousePos : Vector2D = new Vector2D();
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
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveTurret);
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