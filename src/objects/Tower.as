package objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import utils.Vector2D;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Tower extends pObject
	{
		public var towerAmmo : int = 15;  
		
		private var towerMaxAmmo : int = 30;
		private var mousePosition : Vector2D = new Vector2D();
		private var tower_Asset:Object_Tower;
		
		public function Tower() 
		{
			tower_Asset = new Object_Tower();
			addChild(tower_Asset);
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveTurret);
		}
		
		private function moveTurret(e:MouseEvent):void 
		{
			this.rotation = 0;
			mousePosition.x = this.mouseX;
			mousePosition.y = this.mouseY;
			this.rotation = mousePosition.angle * 180 / Math.PI;
		}
		
	}

}