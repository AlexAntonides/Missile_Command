package objects 
{
	import flash.display.Stage;
	import assets.Assets;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class EnemyRocketManager 
	{
		private var _stage:Stage;
		private var missiles:Array = [];
		private var eManager:ExplosionManager;
		
		private var timer:Timer = new Timer(1000, 0);
		
		public static const ROCKET_REMOVED : String = "rocket_removed";
		
		public function EnemyRocketManager(world:Stage) 
		{
			_stage = world;
			
			eManager = new ExplosionManager(this._stage);
			
			_stage.addEventListener(EnemyRocket.REMOVE_ROCKET, removeRocket);
			timer.addEventListener(TimerEvent.TIMER, spawnMissiles);
			timer.start();
		}
		
		private function removeRocket(e:Event):void 
		{
			var currentRocket : EnemyRocket = e.target as EnemyRocket;
			missiles.splice(currentRocket);
			currentRocket.parent.removeChild(currentRocket);
			
			eManager.createExplosion(currentRocket);
		}
		
		private function spawnMissiles(e:TimerEvent):void 
		{
			createMissiles();
		}
		
		private function createMissiles():gObject
		{
			var _missiles:Array = [];
			var missile:gObject = Assets.InstantiateSprite(Assets.ASSET_EROCKET);
				
			missiles = _missiles;
			
			missile.x = randomNumber(30, (_stage.stageWidth -20));
			missile.y = -10;
			
			missile.rotation = randomNumber(135, 45);
			
			_missiles.push(missile);
			_stage.addChildAt(missile, 0);
			
			return missile;
		}
		
		private function randomNumber( min:Number, max:Number):Number
		{
			return min + (max - min) * Math.random();
		}
		
	}

}