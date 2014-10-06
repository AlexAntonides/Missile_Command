package objects 
{
	import flash.display.Stage;
	import assets.Assets;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class TowerManager
	{	
		public static var amountTowers:uint;
		private var _stage:Stage;
		public var towers:Array = [];
		
		public function TowerManager(world:Stage)
		{
			_stage = world;
		}
		
		public function createTowers(_amountTowers:uint):Tower
		{
			amountTowers = _amountTowers;
			var _towers	:	Array = [];
			
			towers = _towers;
			
			for (var i:int = 0; i < _amountTowers ; i++)
			{
				var tower : gObject = Assets.InstantiateSprite(Assets.ASSET_TOWER);
				_stage.addChild(tower);
				_towers.push(tower);
			
				_towers[i].x = _stage.stageWidth / (_amountTowers - 1) * i;
				_towers[i].y = _stage.stageHeight - _towers[i].height / 20;
			}
			
			return _towers[i];
		}
	}

}