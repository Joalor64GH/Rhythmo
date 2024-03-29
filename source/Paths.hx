package;

import openfl.utils.Assets;

import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;

class Paths
{
	static public function file(file:String)
	{
		return 'assets/$file';
	}

	inline static public function txt(key:String)
	{
		return file('data/$key.txt');
	}

	inline static public function xml(key:String)
	{
		return file('data/$key.xml');
	}

	inline static public function json(key:String)
	{
		return file('data/$key.json');
	}

	inline static public function sound(key:String)
	{
		return file('sounds/$key.ogg');
	}

	inline static public function soundRandom(key:String, min:Int, max:Int)
	{
		return file('sounds/$key${FlxG.random.int(min, max)}.ogg');
	}

	inline static public function music(key:String)
	{
		return file('music/$key.ogg');
	}

	inline static public function image(key:String)
	{
		return file('images/$key.png');
	}

	inline static public function font(key:String)
	{
		return file('fonts/$key');
	}

	inline static public function getSparrowAtlas(key:String)
	{
		return FlxAtlasFrames.fromSparrow(image(key), file('images/$key.xml'));
	}

	inline static public function getPackerAtlas(key:String)
	{
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key), file('images/$key.txt'));
	}
}  