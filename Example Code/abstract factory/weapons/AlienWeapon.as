package weapons
{
	
	public class AlienWeapon extends Weapon
	{
		public static const CANNON:uint = 0;
		public static const MINE:uint = 1;
		
		override protected function createProjectile(projectileType:uint):Projectile
		{
			switch(projectileType)
			{
				case CANNON:
					trace("Creating new alien cannonball");
					return new AlienCannonBall();
					break;
				case MINE:
					trace("Creating new alien mine");
					return new AlienMine();
					break;
				default:
					throw new Error("Invalid kind of projectile specified");
					return null;
			}
			
		}
	}
}