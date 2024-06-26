package;

typedef SectionArray = {
    var sectionNotes:Array<Dynamic>;
    var lengthInSteps:Int;
    var typeOfSection:Int;
    var mustHitSection:Bool;
    var bpm:Int;
    var changeBPM:Bool;
}

class Section
{
    public var sectionNotes:Array<Dynamic>;
    public var lengthInSteps:Int = 16;
    public var typeOfSection:Int = 0;
    public var mustHitSection:Bool = true;

    public function new(lengthInSteps:Int = 16)
    {
        this.lengthInSteps = lengthInSteps;
    }
}