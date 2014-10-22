package screens 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author ...
	 */
	public class PreLoaderScreen extends Screen
	{
		/* 
		 * Preloader screen, screen dat preload.
		 * Het script maakt 2 balken aan die laten zien hoe ver de bytes geladen zijn.
		 * Zie PreLoader.as voor de code die hij uitvoert.
		 */
		private var preLoader:PreLoader;
		private var bar:Sprite = new Sprite();
		private var loadedBar:Sprite = new Sprite();
		private var checker:Boolean = true;
		public function PreLoaderScreen() 
		{
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			preLoader = new PreLoader(stage);
			
			bar.graphics.beginFill(0x000000, 1);
			bar.graphics.drawRect(0, -5, 300, 25);
			bar.graphics.endFill();
			
			bar.x = stage.stageWidth / 2 - bar.width / 2;
			bar.y = stage.stageHeight / 2;
			 
			addChild(bar);
			
			loadedBar.graphics.beginFill(0x00FF00, 1);
			loadedBar.graphics.drawRect(0, -5, 1, 25);
			loadedBar.graphics.endFill();
			
			loadedBar.x = stage.stageWidth / 2 - bar.width / 2;
			loadedBar.y = stage.stageHeight / 2;
			 
			addChild(loadedBar);
			
			addEventListener(Event.ENTER_FRAME, MoveBar);
		}
		
		private function MoveBar(e:Event):void 
		{
			if (loadedBar.width >= bar.width) 
			{
				if (checker)
				{
					checker = false;
					
					var endTimer:Timer = new Timer(500, 1);
					endTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
					endTimer.start();
				}
			}
			else 
			{
				loadedBar.width += preLoader.shellLoaded;
			}
		}
		
		private function onComplete(e:TimerEvent):void 
		{
			removeScreen(getScreen(), 2);
		}
		
	}

}