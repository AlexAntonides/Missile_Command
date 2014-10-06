package screen 
{
	import effects.Explosion;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import objects.pObject;
	import utils.Vector2D;
	import objects.Rocket;
	import objects.Tower;
	import objects.Village;
	import assets.Assets;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class GameScreen extends Screen 
	{
		static public const END_GAME:String = "endGame";
		
		private var object_Rockets:Array	= [];
		private var object_Towers:Array 	= [];
		private var object_Villages:Array 	= [];
		
		private var effect_Explosions:Array = [];
		public static var removeExplosion:Boolean = false; 
		
		private var totalVillages:int = 4;
		private var totalTowers:int = 3;
		
		private var rocketSpeed:int = 15;
		private var locationMouse:int;
		
		public function GameScreen() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			for (var i : int = 0; i < totalVillages; i++)
			{
				spawnVillage();
				object_Villages[i].x = stage.stageWidth / (totalVillages - 1) * i;
				object_Villages[i].y = stage.stageHeight - object_Villages[i].height / 20;	
			}
			
			for (var j : int = 0; j < totalTowers; j++)
			{
				spawnTower();
				object_Towers[j].x = stage.stageWidth / (totalTowers - 1) * j;
				object_Towers[j].y = stage.stageHeight - object_Towers[j].height / 20;	
			}
			
			stage.addEventListener(Event.ENTER_FRAME, repeat);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, shootTurret);
		}
		
		private function shootTurret(e:MouseEvent):void
		{
			var counter : int,
				closestTower : Number,
				towersLength : Number,
				object_Rocket : pObject = Assets.InstantiateSprite(Assets.OBJECT_ROCKET);
				
			closestTower = new Number(Number.MAX_VALUE);
			towersLength = object_Towers.length;
						
			for (var k : int = 0; k < towersLength; k++) 
			{
				if ((object_Towers[k].mouseX + object_Towers[k].mouseY) < closestTower) 
				{
					counter = k;
					closestTower = (object_Towers[k].mouseX + object_Towers[k].mouseY);
				}
			}
			
			if (object_Towers[counter].towerAmmo > 0)
			{
				var xPos:Number = Math.cos(object_Rocket.rotation / 180 * Math.PI),
					yPos:Number = Math.sin(object_Rocket.rotation / 180 * Math.PI);
					
				object_Towers[counter].towerAmmo -= 1;
				
				object_Rocket.x = object_Towers[counter].x;
				object_Rocket.y = object_Towers[counter].y;
				
				object_Rocket.rotation = object_Towers[counter].rotation;
				locationMouse = mouseY;
				
				object_Rockets.push(object_Rocket);
				addChildAt(object_Rocket,0);
			}
		}
		
		private function repeat(e:Event):void 
		{
			checkRocket();
		}
		
		private function checkRocket():void 
		{
			var lengthRockets:int = object_Rockets.length;
			var lengthExplosions:int = effect_Explosions.length;
			
			for (var t : int = 0; t < lengthRockets; t++)
			{
				if (object_Rockets[t] != null)
				{
					var angle:Number = object_Rockets[t].rotation,
						radion:Number = angle / (180 / Math.PI),
						moveX:Number = Math.cos (radion) * rocketSpeed,
						moveY:Number = Math.sin (radion) * rocketSpeed;
					
					object_Rockets[t].x += moveX;
					object_Rockets[t].y += moveY;
					
					checkPosition(object_Rockets, object_Rockets[t], locationMouse);
				}
			}
			
			for (var i:  int = 0; i < lengthExplosions; i++)
			{
				if (removeExplosion)
				{
					removeExplosion = false;
					if (effect_Explosions[i] != null)
					{	
						effect_Explosions[i].parent.removeChild(effect_Explosions[i]);
						effect_Explosions.splice(effect_Explosions.indexOf(effect_Explosions[i], 1));
					}
				}
			}
		}
		
		private function checkPosition(_rockets:Array, _rocket:Rocket, mouseLocation:int):void
		{
			if (_rocket.y <= mouseLocation)
			{	
				var explosion : Explosion = new Explosion();
					
				explosion.x = _rocket.x;
				explosion.y = _rocket.y;
				effect_Explosions.push(explosion);
				addChild(explosion);
				
				if (_rocket != null)
				{		
					_rocket.parent.removeChild(_rocket);
					_rockets.splice(_rocket, 1);
				}
			}
		}
		
		private function spawnVillage():void
		{
			var object_Village:Village = new Village;
			addChild(object_Village);
			object_Villages.push(object_Village);
		}
		
		private function spawnTower():void
		{
			var object_Tower:Tower = new Tower;
			addChild(object_Tower);
			object_Towers.push(object_Tower);
		}
		
	}

}