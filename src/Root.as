package
{
	import flash.display.Sprite;
	import PreLoader;
	import screens.Screen;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Root extends Sprite
	{
		/*
		 * Dit is de Root class. Dit is de manager van alle schermen.
		 * Tot nu toe doet deze class niks behalve schermen toevoegen.
		 * Later als ik de game groter wil maken, kan ik nog verwijder functies bij zetten.
		 */
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
			
			placeScreen("preloader");
			
			stage.addEventListener(Screen.ADD_GAME, placeGame);
			stage.addEventListener(Screen.ADD_MENU, placeMenu);
		}
		
		private function placeScreen(type:String):void
		{
			var screen:Screen = new Screen();
			
			switch (type)
			{
				case "preloader": 
					screen.addScreen(Screen.PRELOADERSCREEN, this.stage);
					break;
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
	
		private function placeMenu(e:Event):void 
		{
			placeScreen("menu");
		}
		
		private function placeGame(e:Event):void 
		{
			placeScreen("game");
		}
		
	}

}