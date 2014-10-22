package ginterface 
{
	import assets.Assets;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class SoundManager 
	{
		public const SOUND_EXPLODE	: String 	 = Assets.SND_EXPLODE;
		public const SOUND_FIRE		: String 	 = Assets.SND_FIRE;
		public const SOUND_LOA		: String 	 = Assets.SND_LOWAMMO;
		public const SOUND_OOA		: String 	 = Assets.SND_OUTOFAMMO;
		public const SOUND_START	: String 	 = Assets.SND_START;
		
		public function playSound(string:String):void
		{
			Assets.PlaySound(string);
		}
	}
}