package;

import component.*;

class Flow
{
    public static var EMPTY_RETURN:Array<Dynamic> = new Array<Dynamic>();

    public static function createTrigger(startFn:((Dynamic) -> Void) -> Void):Trigger
    {
        return new TriggerWrapper(startFn);
    }

    public static function createComponent(fn:(Dynamic) -> Array<Dynamic>):Component
    {
        return new ComponentWrapper(fn);
    }
}
