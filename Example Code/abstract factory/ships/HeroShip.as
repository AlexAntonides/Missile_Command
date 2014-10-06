package ships
{
	import flash.display.*;
	import flash.events.*;
	import weapons.HeroWeapon;
	import weapons.Weapon;
	
	internal class HeroShip extends Ship
	{
		private var weapon:Weapon;
		
		override internal function drawShip():void
		{
			graphics.beginFill(0x00FF00); // green color 
			graphics.drawRect( -5, -15, 10, 10); 
			graphics.drawRect( -12, -5, 24, 10); 
			graphics.drawRect( -20, 5, 40, 10); 
			graphics.endFill( );
		}
		
		override internal function initShip():void
		{
			// we maken een HeroWeapon aan. Dit is een abstract factory :)
			weapon = new HeroWeapon();
			
			// bij beweging: update the location van de heroship
			stage.addEventListener(MouseEvent.MOUSE_MOVE, update);
			
			// als je klikt: vuur
			stage.addEventListener(MouseEvent.MOUSE_DOWN, fire);
		}
		
		protected function update(event:MouseEvent):void
		{
			x = event.stageX;
			event.updateAfterEvent();
		}
		
		protected function fire(event:MouseEvent):void
		{
			weapon.fire(HeroWeapon.CANNON, stage, x, y - 25);
			event.updateAfterEvent(); // process this event first }
		}
	}
}