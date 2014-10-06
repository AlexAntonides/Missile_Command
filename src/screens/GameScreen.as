package screens 
{
	import adobe.utils.CustomActions;
	import flash.events.MouseEvent;
	import objects.EnemyRocketManager;
	import objects.gObject;
	import flash.display.Sprite;
	import assets.Assets;
	import flash.events.Event;
	import objects.RocketManager;
	import objects.Tower;
	import utils.Vector2D;
	import objects.Rocket;
	import objects.TowerManager;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class GameScreen extends Screen
	{
		public static var _Ymouse		: 	int;
		
		private var manager		:	TowerManager;
		private var rManager	:   RocketManager;
		private var eManager	:   EnemyRocketManager;
		
		private var level 		:	Number = 1;
		
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
			
			manager = new TowerManager(this.stage);
			manager.createTowers(3);
			
			rManager = new RocketManager(this.stage);
			
			eManager = new EnemyRocketManager(this.stage);
			
			stage.addEventListener(MouseEvent.CLICK, fireMissile);
		}
		
		private function fireMissile(e:MouseEvent):void 
		{
			var counter : int,
				closestTower : Number,
				towersLength : Number;
			
			closestTower = new Number(Number.MAX_VALUE);
			towersLength = manager.towers.length;
			
			for (var i:int = 0; i < towersLength; i++)
			{
				if ((manager.towers[i].mouseX + manager.towers[i].mouseY) < closestTower)
				{
					counter = i;
					closestTower = (manager.towers[i].mouseX + manager.towers[i].mouseY);
				}
			}
			
			if (manager.towers[counter].ammo > 0)
			{
				_Ymouse = mouseY;
				rManager.createMissiles(manager.towers[counter]);
			}
		}
		
	}

}