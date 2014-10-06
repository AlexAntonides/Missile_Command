package screens 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Screen extends Sprite
	{
		public static const GAMESCREEN:uint = 0;
		public static const	MENUSCREEN:uint = 1;
		
		public function addScreen(screenType:uint, target:Stage):void
		{
			var screen:Screen = this.createScreen(screenType);
			
			screen.drawScreen();
			target.addChild(screen);
			screen.initScreen();
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
					
				default:
					throw new Error("Invalid kind of screen specified");
					return null;
			}
		}
		
		internal function drawScreen():void
		{
		}
		
		internal function initScreen():void
		{
		}
	}

}