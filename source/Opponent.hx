package;

class Opponent extends Character
{
    public function new(x:Float, y:Float)
    {
        super(x, y);

        frames = Paths.getSparrowAtlas('opponent');
        animation.addByPrefix('idle', 'Idle', 24);
        animation.addByPrefix('singUP', 'Up', 24);
        animation.addByPrefix('singDOWN', 'Down', 24);
        animation.addByPrefix('singLEFT', 'Left', 24);
        animation.addByPrefix('singRIGHT', 'Right', 24);

        playAnim('idle');

        addOffset('idle', 0, -350);
        addOffset('singUP', 8, -334);
        addOffset('singDOWN', -17, -375);
        addOffset('singLEFT', 22, -353);
        addOffset('singRIGHT', 50, -348);
    }
}