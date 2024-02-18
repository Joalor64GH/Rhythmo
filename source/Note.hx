package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Note extends FlxSprite
{
    public static var time:Int;

    public function new(time:Int, yPos:Float)
    {
        super(0, yPos);
        this.time = time;

        makeGraphic(20, 20, FlxColor.fromRGB(FlxG.random.int(0, 255), FlxG.random.int(0, 255), FlxG.random.int(0, 255)));
        visible = false;
    }

    public function trigger():Void
    {
        FlxG.camera.flash(FlxColor.WHITE, 0.5);
        FlxG.camera.shake(0.01, 0.2);
        visible = true;
    }
}