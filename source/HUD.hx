package;

import flixel.group.FlxSpriteGroup;

class HUD extends FlxSpriteGroup
{
    private var scoreTxt:FlxText;
    private var timeBar:Bar;

    public function new()
    {
        super();

        scoreTxt = new FlxText(0, (FlxG.height * 0.89) + 36, FlxG.height, "Score: 0 // Misses: 0", 20);
        scoreTxt.setFormat(Paths.font('vcr.ttf'), 48, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        scoreTxt.scrollFactor.set();
        scoreTxt.screenCenter(X);
        add(scoreTxt);

        timeBar = new Bar(0, 0, FlxG.width, 10, FlxColor.WHITE, FlxColor.fromRGB(30, 144, 255));
        timeBar.screenCenter(X);
        timeBar.y = FlxG.height - 10;
        add(timeBar);
    }

    override public function update(elapsed:Float)
    {
        timeBar.value = (FlxG.sound.music.time / FlxG.sound.music.length);
        super.update(elapsed);
    }

    public function updateText()
    {
        scoreTxt.text = 'Score: ${PlayState.songScore} // Misses: ${PlayState.songMisses}';
    }
}
