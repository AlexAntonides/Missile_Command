package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Main extends Sprite 
	{
		/* 
		 * Dit is de 'Main' class die als eerst word geladen.
		 * Ik heb de class zo leeg mogenlijk gelaten voor leesbaarheid. 
		 * Deze class zet 'Root' op het scherm, root is de root van de game.
		 * Het is een soort van manager voor alle schermen die er zijn.
		 */
		public function Main():void 
		{
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var _root:Root = new Root();
			addChild(_root);
		}
		
	}
	
}