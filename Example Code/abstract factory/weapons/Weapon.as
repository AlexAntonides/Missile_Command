package weapons
{
	import flash.display.Stage;
	import flash.errors.IllegalOperationError;
	
	// dit is de astract class voor de abstract factory (daarom heet hij ook zo :) )
	public class Weapon
	{
		public function fire(projectileType:uint, target:Stage, x:int, y:int):void
		{
			var projectile:Projectile = createProjectile(projectileType);
			trace("Firing " + projectile.toString());
			// laat het projectiel zichzelf tekeken
			projectile.drawProjectile();
			
			// we zetten de start positie
			projectile.setLoc(x, y);
			
			// we zetten het projectiel op scherp 
			projectile.arm();
			
			// zorg ervoor dat we het projectile ook zien
			target.addChild(projectile);
			
			// en als laatste lanceren we hem
			projectile.release();
			
			// zoals je ziet doen we best veel bij het aanmaken van een projectiel
			// dat is ook het mooie aan een factory. De code staat netjes op een centrale plek
		}
		
		// ABSTRACT Method - deze wordt overschreven door een subclass
		protected function createProjectile(cWeapon:uint):Projectile
		{
			throw new IllegalOperationError("Abstract method:must be overridden in a subclass");
			return null;
		}
	}
}