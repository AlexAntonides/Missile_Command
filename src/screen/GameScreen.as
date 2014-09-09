package screen 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import utils.Vector2D;
	import objects.Rocket;
	import objects.Tower;
	import objects.Village;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class GameScreen extends Screen 
	{
		static public const END_GAME:String = "endGame";
		
		private var mousePosition : Vector2D = new Vector2D();
		
		private var object_Rockets:Array	= [];
		private var object_Towers:Array 	= [];
		private var object_Villages:Array 	= [];
		
		private var totalVillages:int = 4;
		private var totalTowers:int = 3;
		
		private var rocketSpeed:int = 7;
		
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
				object_Rocket : Rocket;
				
			closestTower = new Number(Number.MAX_VALUE);
			towersLength = object_Towers.length;
			object_Rocket = new Rocket();
			
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
				
				object_Rockets.push(object_Rocket);
				addChildAt(object_Rocket,0);
			}
			
		}
		
		private function repeat(e:Event):void 
		{
			var lengthRockets:int = object_Rockets.length;
				
			for (var t : int = 0; t < lengthRockets; t++) 
			{
				var angle:Number = object_Rockets[t].rotation,
					radion:Number = angle / (180 / Math.PI),
					moveX:Number = Math.cos (radion) * rocketSpeed,
					moveY:Number = Math.sin (radion) * rocketSpeed;
				
				object_Rockets[t].x += moveX;
				object_Rockets[t].y += moveY;
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