package;

import flixel.FlxG;
import flixel.FlxSprite;

import flixel.graphics.frames.FlxAtlasFrames;

class Note extends FlxSprite
{
    public function new(x:Float = 0, y:Float = 0)
    {
        super(x, y);

        frames = Paths.getSparrowAtlas('arrows');

        animation.addByPrefix('downI', 'downIdle');
        animation.addByPrefix('downP', 'downPress');
        animation.addByPrefix('downR', 'down');

        animation.addByPrefix('leftI', 'leftIdle');
        animation.addByPrefix('leftP', 'leftPress');
        animation.addByPrefix('leftR', 'left');

        animation.addByPrefix('rightI', 'rightIdle');
        animation.addByPrefix('rightP', 'rightPress');
        animation.addByPrefix('rightR', 'right');

        animation.addByPrefix('upI', 'upIdle');
        animation.addByPrefix('upP', 'upPress');
        animation.addByPrefix('upR', 'up');

        setGraphicSize(width * 0.7);
    }
}