package data 
{
	import flash.display.Stage;
	import flash.net.SharedObject;
	import flash.events.Event;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class DataClass 
	{
		public static var sharedObject:SharedObject = SharedObject.getLocal("highScores");
		public static var score:uint = 0;
		public static var highScore:uint = sharedObject.data.highScores;
		private var _stage:Stage;
		
		public function DataClass(world:Stage)
		{
			_stage = world;
			
			_stage.addEventListener(Event.ENTER_FRAME, UpdateHighscore);
		}
		
		public function SetDataUp(score:uint):void
		{
			if (score >= highScore)
			{
				highScore = score;
			}
		}
		
		private function UpdateHighscore(e:Event):void
		{
			if (score >= highScore)
			{
				highScore = score;
				
				sharedObject.data.highScore = highScore; 
				sharedObject.flush();
			}
		}
		
	}

}