package;

class Main extends openfl.display.Sprite
{
	public function new()
	{
		super();
		addChild(new flixel.FlxGame(1280, 720, PlayState));
	}
}