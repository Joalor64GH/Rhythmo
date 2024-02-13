package;

import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState
{
    var curSong:String = '';

    var strumYPos:Float = 100;
    var noteSize:Float = 20;
    
    override public function create()
    {
        super.create();

        var text:FlxText = new FlxText(0, 0, 0, "Hello World", 64);
        text.screenCenter();
        add(text);

        for (i in 0...4)
        {
            drawNote(400 + i * noteSize, strumYPos, noteSize);
        }
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }

    function drawNote(x:Float, y:Float, size:Float)
    {
        var note:Note = new Note(x, y);
        add(note);
    }
}