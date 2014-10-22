package data 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import objects.EnemyRocket;
	import objects.EnemyRocketManager;
	import screens.GameScreen;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class LevelManager extends Sprite
	{
		private const LEVEL_UP : String = "level_up";
		
		private var eManager	:   EnemyRocketManager;
		private var _stage 		:   Stage;
		
		private var level 		:	Number = 1;
		private var levelUp     :   Boolean = false;
		
		private var _numSpawned :   uint = 5;
		
		private var _numRockets :   uint;
		public function LevelManager(world:Stage) 
		{
			_stage = world;
			
			eManager = new EnemyRocketManager(this._stage);
			
			_stage.addEventListener(Event.ENTER_FRAME, checkRockets);
		}
		
		public function startLevel(value:int):void
		{
			eManager.createMissiles(_numSpawned);
			levelUp = true;
		}
		
		private function checkRockets(e:Event):void 
		{
			_numRockets = eManager.missiles.length;
			
			if (_numRockets == 0 && levelUp)
			{
				level++
				levelUp = false;
				
				updateLevel();
			}
		}
		
		private function updateLevel():void 
		{
			if (_numRockets == 0 && levelUp == false)
			{
				eManager.createMissiles(level * _numSpawned);
				GameScreen._tManager.newAmmo(level);
				levelUp = true;
			}
		}
		
	}

}