package effects 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Explosion extends Sprite
	{
		private var skin:Effect_Explosion = new Effect_Explosion();
		public function Explosion() 
		{
			addChild(skin);
		}
		
	}

}