package objects 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Village extends Sprite
	{
		private var village_Asset:Object_Village;
		public function Village() 
		{
			village_Asset = new Object_Village();
			addChild(village_Asset);
		}
		
	}

}