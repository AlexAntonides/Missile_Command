package screen 
{
	import adobe.utils.CustomActions;
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
		
		private var object_Rockets:Array	= [];
		private var object_Towers:Array 	= [];
		private var object_Villages:Array 	= [];
		
		private var velocity : Vector2D = new Vector2D();
		private var location : Vector2D = new Vector2D();
		
		private var totalVillages:int = 4;
		private var totalTowers:int = 3;
		
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
				object_Villages[i].x = stage.stageWidth * (i * 0.3);
				object_Villages[i].y = stage.stageHeight - object_Villages[i].height / 20;	
			}
			
			for (var j : int = 0; j < totalTowers; j++)
			{
				spawnTower();
				object_Towers[j].x = stage.stageWidth * (j * 0.5);
				object_Towers[j].y = stage.stageHeight - object_Towers[j].height / 2;	
			}
			
			stage.addEventListener(Event.ENTER_FRAME, repeat);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, shootTurret);
		}
		
		private function repeat(e:Event):void 
		{
			updateRocket();
		}
		
		private function shootTurret(e:MouseEvent):void
		{
			
			var chooseTower : int;
			var closest : Number = new Number(Number.MAX_VALUE);
			var towersLength : Number = object_Towers.length;
			
			for (var k : int = 0; k < towersLength; k++) 
			{
				if (object_Towers[k].mouseX + object_Towers[k].mouseY < closest) 
				{
					closest = object_Towers[k].mouseX + object_Towers[k].mouseY;
					chooseTower = k;
				}	
			}
			
			if (object_Towers[chooseTower].ammo > 0)
			{
				var object_Rocket : Rocket = new objects.Rocket();
				
				object_Towers[chooseTower].ammo -= 1;
				
				object_Rocket.x = object_Towers[chooseTower].x;
				object_Rocket.y = object_Towers[chooseTower].y;
				
				object_Rocket.rotation = object_Towers[chooseTower].rotation;
				
				var xPos:Number = Math.cos(object_Rocket.rotation / 180 * Math.PI);
				var yPos:Number = Math.sin(object_Rocket.rotation / 180 * Math.PI);
				
				object_Rockets.push(object_Rocket);
				
				addChildAt(object_Rocket,0);
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
			
		private function updateRocket():void 
		{
			var lengthRockets:int = object_Rockets.length;
			
			for (var i : int = 0; i < lengthRockets; i++) 
			{
				object_Rockets[i].y -= 10;
			}
		}
		
	}

}