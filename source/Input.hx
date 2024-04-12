package;

import flixel.input.keyboard.FlxKey;
import flixel.input.FlxInput.FlxInputState;

class Input
{
    public static var actionMap:Map<String, FlxKey> = [
        "left" => LEFT,
        "down" => DOWN,
        "up" => UP,
        "right" => RIGHT,
        "accept" => ENTER,
        "exit" => ESCAPE
    ];

    public static function is(action:String, ?state:FlxInputState = JUST_PRESSED, ?exact:Bool = false):Bool
    {
        if (!exact)
        {
            if (state == PRESSED && is(action, JUST_PRESSED))
                return true;
            if (state == RELEASED && is(action, JUST_RELEASED))
                return true;
        }
        
        return (actionMap.exists(action)) ? FlxG.keys.checkStatus(actionMap.get(action), state) 
            : FlxG.keys.checkStatus(FlxKey.fromString(action), state);
    }

    public static function get(action:String):FlxInputState
    {
        if (is(action, JUST_PRESSED))
            return JUST_PRESSED;
        if (is(action, PRESSED))
            return PRESSED;
        if (is(action, JUST_RELEASED))
            return JUST_RELEASED;
        
        return RELEASED;
    }
}