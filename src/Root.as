package  
{
	import flash.display.Sprite;
	import screens.Screen;
	import flash.events.Event;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Root extends Sprite
	{
		public function Root() 
		{
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			placeScreen("game");
		}
		
		private function placeScreen(type:String):void
		{
			var screen:Screen = new Screen();
			
			switch(type)
			{
				case "menu":
					screen.addScreen(Screen.MENUSCREEN, this.stage);
					break;
				case "game":
					screen.addScreen(Screen.GAMESCREEN, this.stage);
					break;
				default:
					throw new Error("Invalid type specified at Root class.");
					return null;
			}
		}
		
	}

}