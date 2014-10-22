package
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.getDefinitionByName;
	import flash.utils.Timer;
	import screens.GameScreen;
	
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class PreLoader extends MovieClip
	{
		private var _stage:Stage;
		public var bytestotal:int;
		public var bytesloaded:int;
		public var shellLoaded:int;
		
		public function PreLoader(world:Stage)
		{
			_stage = world;
			
			/* x seconde(s) wachten, zodat je de preloader kan zien! */
			var startTimer:Timer = new Timer(1000, 1);
			startTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onComplete);
			startTimer.start();
		}
		
		private function onComplete(e:TimerEvent):void 
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function onEnterFrame(event:Event):void
		{
			/* Bekijkt de totale bytes geladen en hoeveel hij heeft geladen.
			 * Als shellloaded 100 is, (100% volledig geladen) is de preloader klaar.
			 * Zie PreloaderScreen voor de rest.
			 */
			bytestotal = _stage.loaderInfo.bytesTotal;
			bytesloaded =  _stage.loaderInfo.bytesLoaded;
			shellLoaded = bytesloaded / bytestotal * 100;
			
			if (_stage.loaderInfo.bytesLoaded > 0)
			{
				if (shellLoaded == 100)
				{
					removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				}
			}
		}
	}
}