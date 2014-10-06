package ships
{
	import flash.display.*;
	import flash.events.*;
	import weapons.AlienWeapon;
	import weapons.Weapon;
	
	public class AlienShip extends Ship
	{
		private var weapon:Weapon;
		
		// uit welke projectielen kan het AlienShip kiezen
		private const availableProjectiles:Array = [AlienWeapon.CANNON, AlienWeapon.MINE];
		
		override internal function drawShip():void
		{
			graphics.beginFill(0xFFFFFF); // white color 
			graphics.drawRect( -5, -10, 10, 5);
			graphics.drawRect( -20, -5, 40, 10);
			graphics.drawRect( -20, 5, 10, 5);
			graphics.drawRect(10, 5, 10, 5);
			graphics.endFill( );
		}
		
		override internal function initShip():void
		{
			// we maken een AlienWeapon aan. Dit is een abstract factory :)
			weapon = new AlienWeapon();
			
			// alien mag elke frame kijken of hij wil schieten
			stage.addEventListener(Event.ENTER_FRAME, fire);
		}
		
		protected function fire(event:Event):void
		{
			// 4% kans op een schot
			if (Math.ceil(Math.random() * 25) == 1)
			{
				var projectileType:uint = availableProjectiles[Math.floor(Math.random() * availableProjectiles.length)];
				weapon.fire(projectileType, stage, x, y + 15);
			}
		}
	}
}