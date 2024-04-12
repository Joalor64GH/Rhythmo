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

		switch (curCharacter)
		{
			case 'opponent':
				frames = Paths.getSparrowAtlas('opponent');
                animation.addByPrefix('idle', 'Idle', 24);
                animation.addByPrefix('singUP', 'Up', 24);
                animation.addByPrefix('singDOWN', 'Down', 24);
                animation.addByPrefix('singLEFT', 'Left', 24);
                animation.addByPrefix('singRIGHT', 'RIGHT', 24);

                playAnim('idle');

                addOffset('idle', 0, -350);
                addOffset('singUP', 8, -334);
                addOffset('singDOWN', -17, -375);
                addOffset('singLEFT', 22, -353);
                addOffset('singRIGHT', 50, -348);

			case 'player':
				frames = Paths.getSparrowAtlas('player');
                animation.addByPrefix('idle', 'Idle', 24);
                animation.addByPrefix('singUP', 'Up', 24);
                animation.addByPrefix('singDOWN', 'Down', 24);
                animation.addByPrefix('singLEFT', 'Left', 24);
                animation.addByPrefix('singRIGHT', 'RIGHT', 24);

                playAnim('idle');

                addOffset('idle', 0, -10);
                addOffset('singUP', -45, 11);
                addOffset('singDOWN', -48, -31);
                addOffset('singLEFT', 33, -6);
                addOffset('singRIGHT', -61, -14);

                flipX = true;
		}

		if (isPlayer)
		{
			flipX = !flipX;

			if (!curCharacter.startsWith('player'))
			{
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;
			}
		}
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
		else
			offset.set(0, 0);
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}