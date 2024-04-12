package;

class SongSelectState extends FlxState
{
    var grpSongs:FlxTypedGroup<FlxText>;
    var songs:Array<String> = ["Bopeebo", "Bopeebo", "Bopeebo"]; // only testing for now

    var curSelected:Int = 0;

    var scoreText:FlxText;
    var lerpScore:Int = 0;
    var intendedScore:Int = 0;

    override public function create()
    {
        var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuBG'));
        add(bg);

        var slash:FlxSprite = new FlxSprite().loadGraphic(Paths.image('slash'));
        slash.screenCenter();
        add(slash);

        grpSongs = new FlxTypedGroup<FlxText>();
        add(grpSongs);

        for (i in 0...songs.length)
        {
            var songTxt:FlxText = new FlxText(0, 50 + (i * 130), 0, songs[i], 100);
            songTxt.screenCenter(X);
            songTxt.ID = i;
            grpSongs.add(songTxt);
        }

        var bottomPanel:FlxSprite = new FlxSprite(0, FlxG.height - 100).makeGraphic(FlxG.width, 100, 0xFF000000);
        bottomPanel.alpha = 0.5;
        add(bottomPanel);

        scoreText = new FlxText(20, FlxG.height - 80, 1000, "", 30);
        scoreText.scrollFactor.set();
        scoreText.screenCenter(X);
        add(scoreText);

        var descTxt = new FlxText(scoreText.x, scoreText.y + 36, 1000, "Totally not a copy of FNF! (It is)", 30);
        descTxt.screenCenter(X);
        descTxt.scrollFactor.set();
        add(descTxt);

        changeSelection();

        super.create();
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);

        lerpScore = Math.floor(FlxMath.lerp(lerpScore, intendedScore, 0.4));
        scoreText.text = "PERSONAL BEST: " + lerpScore;

        if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.DOWN)
            changeSelection(FlxG.keys.justPressed.UP ? -1 : 1);

        if (FlxG.keys.justPressed.ENTER)
        {
            var poop:String = Highscore.formatSong(songs[curSelected].toLowerCase());
            PlayState.SONG = Song.loadFromJson(poop, songs[curSelected].toLowerCase());
            FlxG.switchState(new PlayState());
        }
        
        if (FlxG.keys.justPressed.ESCAPE)
            FlxG.switchState(new TitleState());
    }

    function changeSelection(change:Int = 0)
    {
        curSelected += change;

        if (curSelected < 0)
            curSelected = grpSongs.length - 1;
        if (curSelected >= grpSongs.length)
            curSelected = 0;

        grpSongs.forEach((txt:FlxText) ->
        {
            txt.color = (txt.ID == curSelected) ? FlxColor.CYAN : FlxColor.WHITE;
        });

        intendedScore = Highscore.getScore(songs[curSelected]);
    }
}