package objects 
{
	import flash.display.Stage;
	import assets.Assets;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class CarManager 
	{
		private var _amountCars:uint;
		private var _stage:Stage;
		private var _cars:Array = [];
		
		public function CarManager(world:Stage) 
		{
			_stage = world;
		}
		
		public function createCars(amountCars:uint):Car
		{
			_amountCars = amountCars;
			
			for (var i:int = 0; i < _amountCars; i++)
			{
				var car : gObject = Assets.InstantiateSprite(Assets.ASSET_CAR);
				_stage.addChild(car);
				_cars.push(car);
				
				_cars[i].x = Math.random() * _stage.stageWidth;
				_cars[i].y = _stage.stageHeight - _cars[i].height + 5;
			}
			
			return _cars[i];
		}
		
	}

}