package;

#if desktop
import openfl.events.UncaughtErrorEvent;

import haxe.CallStack;
import haxe.io.Path;

import sys.io.File;
import sys.io.Process;
import sys.FileSystem;
#end

class Main extends openfl.display.Sprite
{
	var config:Dynamic = {
		width: 1280, // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
		height: 720, // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
		framerate: 60, // How many frames per second the game should run at.
		initialState: PlayState, // is the state in which the game will start.
		skipSplash: false, // Whether to skip the flixel splash screen that appears in release mode.
		startFullscreen: false // Whether to start the game in fullscreen on desktop targets'
	};

	public function new()
	{
		super();

		addChild(new openfl.display.FPS(10, 3, 0xFFFFFF));
		addChild(new flixel.FlxGame(config.width, config.height, config.initialState, config.framerate, config.framerate,
			config.skipSplash, config.startFullscreen));

		#if desktop
		openfl.Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, (e:UncaughtErrorEvent) -> 
		{
			var errMsg:String = "";
			var path:String;
			var callStack:Array<StackItem> = CallStack.exceptionStack(true);
			var dateNow:String = Date.now().toString();

			dateNow = dateNow.replace(" ", "_");
			dateNow = dateNow.replace(":", "'");

			path = "./crash/" + "game_" + dateNow + ".txt";

			for (stackItem in callStack)
			{
				switch (stackItem)
				{
					case FilePos(s, file, line, column):
						errMsg += file + " (line " + line + ")\n";
					default:
						Sys.println(stackItem);
				}
			}

			errMsg += "\nUncaught Error: " + e.error + "\nPlease report this error to the GitHub page: https://github.com/Joalor64GH/Rhythmo\n\n> Crash Handler written by: sqirra-rng";

			if (!FileSystem.exists("./crash/"))
				FileSystem.createDirectory("./crash/");

			File.saveContent(path, errMsg + "\n");

			Sys.println(errMsg);
			Sys.println("Crash dump saved in " + Path.normalize(path));

			lime.app.Application.current.window.alert(errMsg, "Error!");
			Sys.exit(1);
		});
		#end
	}
}
