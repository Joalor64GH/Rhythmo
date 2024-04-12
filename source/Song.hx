package;

import Section.SectionArray;
import openfl.Assets;

typedef SongData =
{
	var song:String;
	var notes:Array<SectionArray>;
	var bpm:Int;
	var needsVoices:Bool;
	var speed:Float;

	var player1:String;
	var player2:String;
}

class Song
{
	public var song:String;
	public var notes:Array<SectionArray>;
	public var bpm:Int;
	public var needsVoices:Bool = true;
	public var speed:Float = 1;

	public var player1:String = 'player';
	public var player2:String = 'opponent';

	public function new(song, notes, bpm)
	{
		this.song = song;
		this.notes = notes;
		this.bpm = bpm;
	}

	public static function loadFromJson(jsonInput:String, ?folder:String):SongData
	{
		var rawJson = Assets.getText('assets/data/' + folder.toLowerCase() + '/' + jsonInput.toLowerCase() + '.json').trim();

		while (!rawJson.endsWith("}"))
			rawJson = rawJson.substr(0, rawJson.length - 1);

		return parseJSONshit(rawJson);
	}

	public static function parseJSONshit(rawJson:String):SongData
	{
		var swagShit:SongData = cast Json.parse(rawJson).song;
		return swagShit;
	}
}