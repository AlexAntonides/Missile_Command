package screens 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import assets.Assets;
	import flash.system.fscommand;
	import data.DataClass;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class MenuScreen extends Screen
	{
		private var startButton:Sprite = new Sprite;
		private var exitButton:Sprite = new Sprite;
		
		private var btnWidth:uint = 100;
		private var btnHeight:uint = 100;
		
		private var highScore:uint = DataClass.highScore;
		private var textScore:TextField;
		public function MenuScreen() 
		{
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			startButton.graphics.beginFill(0x00FF00, 1);
			startButton.graphics.drawRect((stage.stageWidth / 2) - (btnWidth * 2), stage.stageHeight / 2, btnWidth, btnHeight);
			startButton.graphics.endFill();
			
			exitButton.graphics.beginFill(0xFF0000, 1);
			exitButton.graphics.drawRect((stage.stageWidth / 2) + (btnWidth), stage.stageHeight / 2, btnWidth, btnHeight);
			exitButton.graphics.endFill();
			
			textScore = Assets.InstantiateText(String(highScore));
			textScore.text = "HighScore: " + String(highScore);
			textScore.x = stage.stageWidth / 2 - 25;
			textScore.y = stage.stageHeight - stage.stageHeight;
			
			addChild(startButton);
			addChild(exitButton);
			addChild(textScore);
			
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			if (e.target == startButton)
			{
				removeScreen(getScreen(), 1);
			}
			else if (e.target == exitButton)
			{
				fscommand("quit");
			}
		}
		
	}

}