package flow;

import component.*;

class Flow
{
    public static var EMPTY_RETURN:Array<Dynamic> = new Array<Dynamic>();

    /**
        Returns a Trigger that runs the given callback when started.
        The callback is given an emit callback to emit signals.
    **/
    public static function getTrigger(startFn:((Dynamic) -> Void) -> Void):Trigger
    {
        return new TriggerWrapper(startFn);
    }

    /**
        Returns a Component that runs the given callback when signals are received,
        and then emits out signals returned from the callback.
    **/
    public static function getComponent(fn:(Dynamic) -> Array<Dynamic>):Component
    {
        return new ComponentWrapper(fn);
    }

    /**
        Returns a Consumer that runs the given callback when signals are received,
        and then emits out signals returned from the callback.
    **/
    public static function getConsumer(fn:(Dynamic) -> Void):Consumer
    {
        return new ConsumerWrapper(fn);
    }
}
