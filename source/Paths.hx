package;

import openfl.display.BitmapData;
import flixel.graphics.frames.FlxAtlasFrames;

class Paths
{
	inline public static final SOUND_EXT = #if !html5 "ogg" #else "mp3" #end;
	inline public static final DEFAULT_FOLDER:String = 'assets';

	private static var trackedBitmaps:Map<String, BitmapData> = new Map();
	private static var localTracked:Array<String> = [];

	public static function setBitmap(id:String, ?bitmap:BitmapData):BitmapData
	{
		if (!trackedBitmaps.exists(id) && bitmap != null)
			trackedBitmaps.set(id, bitmap);
		pushTracked(id);
		return trackedBitmaps.get(id);
	}

	public static function disposeBitmap(id:String)
	{
		var obj:Null<BitmapData> = trackedBitmaps.get(id);
		if (obj != null)
		{
			obj.dispose();
			obj.disposeImage();
			obj = null;
			trackedBitmaps.remove(id);
		}
	}

	public static function pushTracked(file:String)
	{
		if (!localTracked.contains(file))
			localTracked.push(file);
	}

	static public function getPath(folder:Null<String>, file:String)
	{
		if (folder == null) folder = DEFAULT_FOLDER;
		return folder + '/' + file;
	}

	static public function file(file:String, folder:String = DEFAULT_FOLDER)
	{
		if (#if sys FileSystem.exists(folder) && #end (folder != null && folder != DEFAULT_FOLDER))
			return getPath(folder, file);
		
		return getPath(null, file);
	}

	inline static public function txt(key:String)
		return file('data/$key.txt');

	inline static public function xml(key:String)
		return file('data/$key.xml');

	inline static public function json(key:String)
		return file('data/$key.json');

	#if yaml
	inline static public function yaml(key:String)
		return file('data/$key.yaml');
	#end

	inline static public function sound(key:String)
		return file('sounds/$key.$SOUND_EXT');

	inline static public function soundRandom(key:String, min:Int, max:Int)
		return file('sounds/$key${FlxG.random.int(min, max)}.$SOUND_EXT');

	inline static public function music(key:String)
		return file('music/$key.$SOUND_EXT');

	inline static public function image(key:String)
		return file('images/$key.png');

	inline static public function font(key:String)
		return file('fonts/$key');

	inline static public function getSparrowAtlas(key:String)
		return FlxAtlasFrames.fromSparrow(image(key), file('images/$key.xml'));

	inline static public function getPackerAtlas(key:String)
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key), file('images/$key.txt'));
}