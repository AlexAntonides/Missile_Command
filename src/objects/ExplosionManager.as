package objects 
{
	import flash.display.Stage;
	import assets.Assets;
	import flash.events.Event;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class ExplosionManager 
	{
		private var _stage:Stage;
		public static var explosions:Array = [];
		public static const EXPLOSION_REMOVED : String = "explosion_removed";
		public function ExplosionManager(world:Stage) 
		{
			_stage = world;
			
			_stage.addEventListener(Explosion.GROW_COMPLETE, removeExplosion);
		}
		
		private function removeExplosion(e:Event):void
		{
			var currentExplosion : Explosion = e.target as Explosion;
			if (currentExplosion.parent)
			{
				explosions.splice(currentExplosion);
				currentExplosion.parent.removeChild(currentExplosion);
			}
		}
		
		
		public function createExplosion(missile:gObject):gObject
		{
			var _explosions:Array = [];
			var explosion:gObject = Assets.InstantiateSprite(Assets.ASSET_EXPLOSION);
				
			explosions = _explosions;
			
			explosion.x = missile.x;
			explosion.y = missile.y;
			
			_explosions.push(explosion);
			_stage.addChildAt(explosion, 0);
			
			return explosion;
		}
		
	}

}