package weapons
{
	import flash.events.*;
	
	internal class AlienMine extends Projectile
	{
		override internal function drawProjectile():void
		{
			graphics.lineStyle(3, 0xFF0000);
			graphics.drawRect(-5, -5, 10, 10);
		}
		
		override internal function arm():void
		{
			speed = 2; // set the speed
		}
		
		override internal function update(event:Event):void
		{
			super.update(event);
			this.rotation += 5; // rotate
		}
	}
}