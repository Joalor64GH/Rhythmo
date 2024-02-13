package;

import flixel.FlxG;

import haxe.Json;
import openfl.utils.Assets;

using StringTools;

typedef SongData = {
    var song:String;
    var bpm:Float;
    var speed:Float;
    var notes:Array<NoteData>;
}

typedef NoteData = {
    var sectionNotes:Array<Dynamic>;
}

class Song
{
    public static function loadSong(jsonInput:String, ?folder:String):SongData
        return parseJson(Paths.json('data/' + folder.toLowerCase() + '/' + jsonInput.toLowerCase()).trim());
    
    public static function parseJson(path:String):SongData
    {
        var rawJson:String = null;

        if (Assets.exists(rawJson))
            rawJson = Assets.getText(path);

        var daSwag:SongData = Json.parse(rawJson).song;
        return daSwag;
    }
}