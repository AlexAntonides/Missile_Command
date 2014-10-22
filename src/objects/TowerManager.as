package objects 
{
	import flash.display.Stage;
	import assets.Assets;
	import ginterface.SoundManager;
	import screens.GameScreen;
	import utils.Vector2D;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class TowerManager
	{	
		public static var _Ymouse		: 	int;
		public static var amountTowers:uint;
		
		private var rManager	:   RocketManager;
		private var sManager	:   SoundManager = new SoundManager;
		private var _stage:Stage;
		private var _towers:Array = [];
		
		private var managers:GameScreen = new GameScreen();
		
		public function TowerManager(world:Stage)
		{
			_stage = world;
			rManager = new RocketManager(_stage);
		}
		
		public function createTowers(_amountTowers:uint):Tower
		{
			amountTowers = _amountTowers;
			
			for (var i:int = 0; i < _amountTowers ; i++)
			{
				var tower : gObject = Assets.InstantiateSprite(Assets.ASSET_TOWER);
				_stage.addChild(tower);
				towers.push(tower);
				
			
				towers[i].x = _stage.stageWidth / (_amountTowers - 1) * i;
				towers[i].y = _stage.stageHeight - towers[i].height / 20;
			}
			
			return towers[i];
		}
		
		public function fireMissile(mouseX:Number, mouseY:Number):void
		{
			var counter : int,
				closestTower : Number,
				towersLength : Number;
			
			closestTower = new Number(Number.MAX_VALUE);
			towersLength = towers.length;
			
			for (var i:int = 0; i < towersLength; i++)
			{
				if ((towers[i].mouseX + towers[i].mouseY) < closestTower)
				{
					counter = i;
					closestTower = (towers[i].mouseX + towers[i].mouseY);
				}
			}
			
			/*
			 * Ik heb geen abstract factory, omdat ik A. het niet nodig vond.
			 * en B. Ik er geen tijd voor had omdat ik het op het laatste moment las.
			 */
			
			if (towers[counter].ammo > 0)
			{
				_Ymouse = mouseY;
				sManager.playSound(sManager.SOUND_FIRE);
				towers[counter].ammo--;
				rManager.createMissiles(towers[counter]);
			}
			else if (towers[counter].ammo == 0)
			{
				sManager.playSound(sManager.SOUND_OOA);
			}
		}
		
		public function newAmmo(level:int):void
		{
			for (var i:int; i < towers.length; i++)
			{
				towers[i].ammo = level * 5;
				towers[i].totalAmmo = towers[i].ammo;
			}
		}
		
		public function get towers():Array 
		{
			return _towers;
		}
		
		public function set towers(value:Array):void 
		{
			_towers = value;
		}
	}

}