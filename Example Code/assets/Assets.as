package assets 
{
	import flash.display.Sprite;
	import objects.pObject;
	import objects.Rocket;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Assets 
	{
		public static const OBJECT_ROCKET : String		=	"object_rocket";
		
		public static function InstantiateSprite( type : String ) : pObject 
		{
			// lokale variabele waar de het nieuwe ruimteschip in opslaan
			var enemy : pObject;
			
			if(type == OBJECT_ROCKET)
			{
				enemy = new Rocket();
			}
			
			return enemy;
		}
	}

}