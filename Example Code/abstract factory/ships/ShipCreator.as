package ships
{
	import flash.display.Stage;
	
	public class ShipCreator
	{
		public static const HERO:uint = 0;
		public static const ALIEN:uint = 1;
		
		// Dit is een simple Factory zoals we dat vorige week ook deden
		// de functie addShip geeft netjes aan wat de fabriek allemaal nodig heeft om voor jou
		// een product te maken
		public function addShip(shipType:uint, target:Stage, xLoc:int, yLoc:int):void
		{
			// net zoals vorige week maken we eerst het schip aan
			var ship:Ship = this.createShip(shipType);
			// en vervolgens passen we wat instellingen aan
			// hierdoor staat de 'creatie logica' netjes op 1 plek (namelijk in deze Class, inplaats van
			// op verschillende plekken in je Game)
			ship.drawShip();
			ship.setLoc(xLoc, yLoc);
			target.addChild(ship);
			ship.initShip();
		}
		
		// net als vorige week hebben we een switch tussen welke
		// type schip je aan wilt maken.
		private function createShip(shipType:uint):Ship
		{
			
			switch(shipType)
			{
				case HERO:
					trace("Creating new hero ship");
					return new HeroShip();
					break;
				case ALIEN:
					trace("Creating new alien ship");
					return new AlienShip();
					break;
				default:
					throw new Error("Invalid kind of ship specified");
					return null;	
			}
			
		}
	}
}