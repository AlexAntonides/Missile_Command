package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import ships.ShipCreator;
	
	/**
	 * ...
	 * @author Berend Weij
	 */
	public class Main extends Sprite
	{
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// we maken eerst de factory aan voor de schepen
			var shipFactory:ShipCreator = new ShipCreator();
			
			// vervolgens maken we de speler aan.
			shipFactory.addShip(ShipCreator.HERO, this.stage, this.stage.stageWidth / 2, this.stage.stageHeight - 20);
			
			// en we plaatsen wat Alienships via dezelfde fabriek
			// maar we vragen een ander product aan
			for (var i:Number = 0; i < 5; i++)
			{
				shipFactory.addShip(ShipCreator.ALIEN, this.stage, 120 + 80 * i, 100);
			}
		
		}
	
	}

}