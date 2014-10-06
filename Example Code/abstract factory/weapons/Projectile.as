package weapons
{
	import flash.display.Sprite;
	import flash.events.*;
	
	// ABSTRACT Class
	internal class Projectile extends Sprite
	{
		internal var speed:Number;
		
		// ABSTRACT Method - wordt overschreven door subclasses 
		internal function drawProjectile():void
		{
		}
		
		internal function arm():void
		{
			// set de default snelheid voor een projectiel
			speed = 5;
		}
		
		internal function release():void
		{
			// als we gelanceerd worden: dan mogen we elke frame updaten
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		internal function setLoc(xLoc:int, yLoc:int):void
		{
			x = xLoc;
			y = yLoc;
		}
		
		internal function update(event:Event):void
		{
			y += speed;
			// als het projectiel buiten beeld is, dan verwijderen we hem
			if ((y < 0) || (y > stage.stageHeight))
			{
				removeEventListener(Event.ENTER_FRAME, update);
				stage.removeChild(this);
			}
		}
	}
}