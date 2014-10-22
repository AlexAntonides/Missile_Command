package assets 
{
	import flash.text.Font;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class EmbeddedAssets 
	{
		[Embed(source = "../../lib/embedded/sound/Explode.mp3")]
		public static const Explode:Class;
		[Embed(source = "../../lib/embedded/sound/Fire.mp3")]
		public static const Fire:Class;
		[Embed(source = "../../lib/embedded/sound/Low.mp3")]
		public static const Low:Class;
		[Embed(source = "../../lib/embedded/sound/Out Of Ammo.mp3")]
		public static const OutOfAmmo:Class;
		[Embed(source = "../../lib/embedded/sound/Start.mp3")]
		public static const Start:Class;
		
		[Embed(source = "../../lib/embedded/font/arial.ttf",
			   embedAsCFF = "false",
			   fontName = Assets.FONT_NORMAL,
			   fontFamily = Assets.FONT_NORMAL,
			   mimetype = "application/x-font",
			   advancedAntiAliasing = "true"
			   )]	
		public static const Arial:Class;
	}

}