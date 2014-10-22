package screens 
{
	import adobe.utils.CustomActions;
	import data.LevelManager;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import ginterface.SoundManager;
	import objects.CarManager;
	import objects.EnemyRocketManager;
	import objects.gObject;
	import flash.display.Sprite;
	import assets.Assets;
	import flash.events.Event;
	import objects.RocketManager;
	import data.DataClass;
	import objects.Tower;
	import utils.Vector2D;
	import objects.Rocket;
	import objects.TowerManager;
	import flash.display.StageDisplayState;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class GameScreen extends Screen
	{
		public static var _tManager		:	TowerManager;
		
		private var _lManager 		:   LevelManager;
		private var _sManager		:   SoundManager;
		private var _cManager		:   CarManager;
		
		private var _score	: int;
		private var _highScore : int;
		
		private var _textScore : TextField;
		private var _textHighScore : TextField;
		
		public function GameScreen() 
		{
			if (stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			/*
			 * Ervoor gezorgt dat je alleen de managers hoeft aan te roepen, om iets te maken.
			 */
			
			_tManager = new TowerManager(this.stage);
			_tManager.createTowers(3);
			
			_lManager = new LevelManager(this.stage);
			_lManager.startLevel(1);
			
			_cManager = new CarManager(this.stage);
			_cManager.createCars(5);
			
			_sManager = new SoundManager();
			_sManager.playSound(_sManager.SOUND_START);
			
			createScore();
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, fullScreen);
			stage.addEventListener(MouseEvent.CLICK, fireMissile);
		}
		
		private function loop(e:Event):void 
		{
			_score = DataClass.score;
			_highScore = DataClass.highScore;
			
			_textScore.text = "Score: " + String(_score);
			_textHighScore.text = "Highscore: " + String(_highScore);
		}
		
		private function fullScreen(e:KeyboardEvent):void 
		{
			if (e.keyCode == 32)
			{
				stage.displayState = StageDisplayState.FULL_SCREEN;
			}
			if (e.keyCode == 27)
			{
				stage.displayState = StageDisplayState.NORMAL;
			}
		}
		
		private function fireMissile(e:MouseEvent):void 
		{
			_tManager.fireMissile(mouseX, mouseY);
		}
		
		private function createScore():void 
		{
			_textScore = Assets.InstantiateText(String(_score));
			_textHighScore = Assets.InstantiateText(String(_highScore));
			
			_textScore.x = stage.stageWidth / 2 - 150;
			_textHighScore.x = stage.stageWidth / 2 + 100;
			
			_textScore.y = stage.stageHeight - stage.stageHeight;
			_textHighScore.y = stage.stageHeight - stage.stageHeight;
			
			addChild(_textScore);
			addChild(_textHighScore);
		}
	}

}