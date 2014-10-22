package assets
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import objects.Car;
	import objects.EnemyRocket;
	import objects.Explosion;
	import objects.gObject;
	import objects.Rocket;
	import objects.Tower;
	import assets.EmbeddedAssets;
	
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Assets
	{
		public static const ASSET_TOWER:String = "asset_tower";
		public static const ASSET_ROCKET:String = "asset_rocket";
		public static const ASSET_EXPLOSION:String = "asset_explosion";
		public static const ASSET_EROCKET:String = "asset_erocket";
		public static const ASSET_CAR:String = "asset_car";
		
		public static const SND_EXPLODE:String = "snd_explode";
		public static const SND_FIRE:String = "snd_fire";
		public static const SND_LOWAMMO:String = "snd_lowammo";
		public static const SND_OUTOFAMMO:String = "snd_outofammo";
		public static const SND_START:String = "snd_start";
		
		public static function InstantiateSprite(type:String):gObject
		{
			var object:gObject;
			
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
			else if (type == ASSET_CAR)
			{
				object = new Car();
			}
			else
			{
				throw new Error("Invalid type specified in Assets class: Instantiate Sprite.");
				return null;
			}
			
			return object;
		}
		
		public static function InstantiateText(string:String, textColor:uint = 0x000000):TextField
		{
			var text:TextField = new TextField();
			
			text.text = string;
			text.textColor = textColor;
			
			return text;
		}
		
		public static function PlaySound(type:String, sc:SoundChannel = null, st:SoundTransform = null, sTime:int = 1, loops:int = 1):SoundChannel
		{
			var sound:Sound;
			
			if (sc == null)
			{
				sc = new SoundChannel();
			}
			
			if (st == null)
			{
				st = new SoundTransform(1, 1);
			}
			
			if (type == SND_EXPLODE)
			{
				sound = new EmbeddedAssets.Explode() as Sound;
			}
			else if (type == SND_FIRE)
			{
				sound = new EmbeddedAssets.Fire() as Sound;
			}
			else if (type == SND_LOWAMMO)
			{
				sound = new EmbeddedAssets.Low() as Sound;
			}
			else if (type == SND_OUTOFAMMO)
			{
				sound = new EmbeddedAssets.OutOfAmmo() as Sound;
			}
			else if (type == SND_START)
			{
				sound = new EmbeddedAssets.Start() as Sound;
			}
			else
			{
				throw new Error("Invalid type specified in Assets Class: PlaySound.");
				return null;
			}
			
			sc = sound.play(sTime, loops, st);
			
			return sc;
		}
	}

}