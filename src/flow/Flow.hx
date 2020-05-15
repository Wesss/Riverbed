package flow;

import component.*;

class Flow
{
    public static var EMPTY_RETURN:Array<Any> = new Array<Any>();

    /**
        Returns a Trigger that runs the given callback when started.
        The callback is given an emit callback to emit signals.
    **/
    public static function getTrigger(startFn:((Any) -> Void) -> Void):Trigger
    {
        return new TriggerWrapper(startFn);
    }

    /**
        Returns a Component that runs the given callback when signals are received,
        and then emits out signals returned from the callback.
    **/
    public static function getComponent<T>(fn:(T) -> Array<Any>):Component<T>
    {
        return new ComponentWrapper(fn);
    }

    /**
        Returns a Consumer that runs the given callback when signals are received,
        and then emits out signals returned from the callback.
    **/
    public static function getConsumer<T>(fn:(T) -> Void):Consumer<T>
    {
        return new ConsumerWrapper<T>(fn);
    }
}
