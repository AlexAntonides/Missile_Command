package assets 
{
	import objects.EnemyRocket;
	import objects.Explosion;
	import objects.gObject;
	import objects.Rocket;
	import objects.Tower;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Assets 
	{
		public static const ASSET_TOWER	 	: String	 = "asset_tower";
		public static const ASSET_ROCKET 	: String  	 = "asset_rocket"; 
		public static const ASSET_EXPLOSION : String	 = "asset_explosion";
		public static const ASSET_EROCKET 	: String 	 = "asset_erocket";
 		
		public static function InstantiateSprite( type : String ) : gObject
		{
			var object : gObject;
			
			if (type == ASSET_TOWER)
			{
				object = new Tower();
			}
			else if (type == ASSET_ROCKET)
			{
				object = new Rocket();
			}
			else if (type == ASSET_EXPLOSION)
			{
				object = new Explosion();
			}
			else if (type == ASSET_EROCKET)
			{
				object = new EnemyRocket();
			}
			else
			{
				throw new Error("Invalid type specified in Assets class.");
				return null;
			}
			
			return object;
		}
		
	}

}