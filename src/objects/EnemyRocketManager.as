package objects 
{
	import data.LevelManager;
	import flash.display.Stage;
	import assets.Assets;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import ginterface.SoundManager;
	import flash.utils.Timer;
	import utils.Vector2D;
	import screens.GameScreen;
	import objects.Explosion;
	import data.DataClass;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class EnemyRocketManager 
	{
		private var _stage:Stage;
		public var missiles:Array = [];
		private var _sManager:SoundManager = new SoundManager();
		private var eManager:ExplosionManager;
		private var tManager:TowerManager;
		private var objectLocation:Vector2D = new Vector2D();
		
		public static const ROCKET_REMOVED : String = "rocket_removed";
		
		public function EnemyRocketManager(world:Stage) 
		{
			_stage = world;
			
			eManager = new ExplosionManager(this._stage);
			
			_stage.addEventListener(Explosion.ROCKET_REMOVE, removeRocket);
			_stage.addEventListener(EnemyRocket.REMOVE_ROCKET, removeRocket);
		}
		
		private function removeRocket(e:Event):void 
		{
			var currentRocket : EnemyRocket = e.target as EnemyRocket;
			
			missiles.splice(missiles.indexOf(currentRocket, 1));
			currentRocket.parent.removeChild(currentRocket);
			
			_sManager.playSound(_sManager.SOUND_EXPLODE);
			eManager.createExplosion(currentRocket);
			
			DataClass.score += 10;
		}
		
		public function createMissiles(amountRockets:int = 1):gObject
		{
			for (var i:int = 0; i < amountRockets; i++)
			{
				var missile:gObject = Assets.InstantiateSprite(Assets.ASSET_EROCKET);	
					
				missile.x = randomNumber(30, (_stage.stageWidth -20));
				missile.y = -10;
				
				missile.rotation = 0;
				
				missile.rotation = objectLocation.angle * 180 / Math.PI;
				
				missile.rotation = randomNumber(135, 45);
				
				missiles.push(missile);
				_stage.addChildAt(missile, 0);
			}
				
			
			return missile;
		}
		
		private function randomNumber( min:Number, max:Number):Number
		{
			return min + (max - min) * Math.random();
		}
		
	}

}