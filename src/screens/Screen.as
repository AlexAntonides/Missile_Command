package screens 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.net.SharedObject;
	import data.DataClass;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Screen extends Sprite
	{
		/*
		 * Super class van alle screens. 
		 * Zorgt ervoor dat de highscores geladen worden.
		 */
		public static const GAMESCREEN			:uint = 0;
		public static const	MENUSCREEN			:uint = 1;
		public static const PRELOADERSCREEN 	:uint = 2;
		
		public static const ADD_MENU	: String = "add_menu";
		public static const ADD_GAME	: String = "add_game";
		
		public static var sharedObject:SharedObject = SharedObject.getLocal("highScores");
		
		public static var currentScreen:Screen;
		private var dataClass:DataClass;
		
		public function Screen()
		{
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var i:uint = sharedObject.data.highScore;
			dataClass = new DataClass(this.stage);
			
			dataClass.SetDataUp(i);
		}
		
		public function addScreen(screenType:uint, target:Stage):void
		{
			var screen:Screen = this.createScreen(screenType);
			currentScreen = screen;
			
			target.addChild(screen);
		}
		
		public function removeScreen(currentScreen:Screen, addGame:uint = 1):void
		{
			/* Op dit moment is het visible = false ipv delete. RemoveChild werkt niet, dus dit vanwege tijds problemen. */
			currentScreen.visible = false;
			
			if (addGame == 1)
			{
				dispatchEvent(new Event(ADD_GAME, true));
			}
			else if (addGame == 2)
			{
				dispatchEvent(new Event(ADD_MENU, true));
			}
		}
		
		private function createScreen(screenType:uint):Screen
		{
			switch(screenType)
			{
				case MENUSCREEN:
						return new MenuScreen();
					break;
					
				case GAMESCREEN:
						return new GameScreen();
					break;
				case PRELOADERSCREEN:
						return new PreLoaderScreen();
					break;
				default:
					throw new Error("Invalid kind of screen specified");
					return null;
			}
		}
		
		public function getScreen():Screen
		{
			return currentScreen;
		}
	}

}