package effects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import screen.GameScreen;
	/**
	 * ...
	 * @author Alex Antonides
	 */
	public class Explosion extends Sprite
	{
		private var skin:Effect_Explosion = new Effect_Explosion();
		private var maxSize:Boolean = false;
		public function Explosion() 
		{
			addChild(skin);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void
		{
			Grow();
		}
		
		private function Grow():void
		{
			var growSpeed:Number = 0.3;
				
				//Perfecte idee van Ramses; Boolean. Kan je hier niet cases voor gebruiken?
				
				if (maxSize == false)
				{
					this.scaleX += growSpeed;
					this.scaleY += growSpeed;
				}
				else
				{
					this.scaleX -= growSpeed;
					this.scaleY -= growSpeed;
				}
				
				if (this.scaleX > 3)
				{
					maxSize = true;
				}
				else if (this.scaleX < 0)
				{
					maxSize = false;
					GameScreen.removeExplosion = true;
				}
			}
		}
	}