package ships
{
	import flash.display.Sprite;
	import flash.events.*;
	
	// ABSTRACT Class (deze mag niet geinstantieerd worden. Er zijn subclasses die deze class
	// extenden (inheritance)
	internal class Ship extends Sprite
	{
		
		// algemene method om het schip op een x en y te zetten
		internal function setLoc(xLoc:int, yLoc:int):void
		{
			x = xLoc;
			y = yLoc;
		}
		
		// ABSTRACT Method (deze wordt overschreven in een subclass)
		internal function drawShip():void
		{
		}
		
		// ABSTRACT Method (deze wordt overschreven in een subclass)
		internal function initShip():void
		{
		}
	}
}