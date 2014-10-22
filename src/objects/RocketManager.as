package objects 
{
	import flash.display.Stage;
	import assets.Assets;
	import flash.events.Event;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class RocketManager 
	{
		private var _stage:Stage;
		private var missiles:Array = [];
		private var eManager:ExplosionManager;
		
		public static const ROCKET_REMOVED : String = "rocket_removed";
		
		public function RocketManager(world:Stage)
		{
			_stage = world;
			eManager = new ExplosionManager(this._stage);
			
			_stage.addEventListener(Rocket.REACHED_LOCATION, removeRocket);
		}
		
		private function removeRocket(e:Event):void 
		{
			var currentRocket : Rocket = e.target as Rocket;
			missiles.splice(currentRocket);
			currentRocket.parent.removeChild(currentRocket);
			
			eManager.createExplosion(currentRocket);
		}
	
		public function createMissiles(tower:gObject):gObject
		{
			var _missiles:Array = [],
				missile:gObject = Assets.InstantiateSprite(Assets.ASSET_ROCKET);
				
			missiles = _missiles;
			
			missile.x = tower.x;
			missile.y = tower.y;
			
			missile.rotation = tower.rotation;
					
			_missiles.push(missile);
			_stage.addChildAt(missile, 0);
					
			return missile;
		}
		
	}

}