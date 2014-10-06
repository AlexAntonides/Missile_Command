package weapons
{
	
	public class HeroWeapon extends Weapon
	{
		public static const CANNON:uint = 0;
		
		override protected function createProjectile(projectileType:uint):Projectile
		{
			switch(projectileType)
			{
				case CANNON:
					trace("Creating new Hero cannonball");
					return new HeroCannonBall();
					break;
				default:
					throw new Error("Invalid kind of projectile specified");
					return null;
			}
		}
	}
}