package;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'player';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "player", ?isPlayer:Bool = false)
	{
		animOffsets = new Map<String, Array<Dynamic>>();
		super(x, y);

		curCharacter = character;
		this.isPlayer = isPlayer;

		antialiasing = true;
	}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('player'))
		{
			if (animation.curAnim.name.startsWith('sing'))
				holdTimer += elapsed;

			var aVar:Float = 4;

			if (curCharacter == 'opponent')
				aVar = 6.1;
			
			if (holdTimer >= Conductor.stepCrochet * aVar * 0.001)
			{
				playAnim('idle');
				holdTimer = 0;
			}
		}

		super.update(elapsed);
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(animation.curAnim.name);
		if (animOffsets.exists(animation.curAnim.name))
			offset.set(daOffset[0], daOffset[1]);
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}