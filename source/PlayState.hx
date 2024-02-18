package;

import flixel.sound.FlxSound;

import flixel.util.FlxColor;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxG;

class PlayState extends BeatState
{
    var curSong:String = '';

    var music:FlxSound;
    var notes:Array<Note>;
    var currentNoteIndex:Int = 0;
    
    override public function create()
    {
        super.create();

        var text:FlxText = new FlxText(0, 0, 0, "use space at the moment\nidk", 64);
        text.screenCenter();
        add(text);

        var strumline:FlxSprite = new FlxSprite(0, FlxG.height - 20).makeGraphic(FlxG.width, 5, FlxColor.WHITE);
        add(strumline);

        music = FlxG.sound.load(Paths.music('synth'), 1); // just for testing
        music.play(true);

        notes = [
            new Note(0, 1000),
            new Note(1000, 2000)
        ];

        for (note in notes)
            add(note);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (currentNoteIndex < notes.length && music.time >= notes[currentNoteIndex].time)
        {
            notes[currentNoteIndex].trigger();
            currentNoteIndex++;
        }

        for (note in notes)
        {
            note.y += 100 * elapsed;
            if (note.y > FlxG.height)
            {
                note.kill();
                trace('missed!');
            }
        }

        if (FlxG.keys.justPressed.SPACE)
        {
            if (currentNoteIndex < notes.length && notes[currentNoteIndex].visible)
            {
                notes[currentNoteIndex].kill();
                trace('note hit!');
            }
            else
                trace('missed!');
        }
    }
}