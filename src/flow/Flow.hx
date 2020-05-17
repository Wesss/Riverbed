package flow;

import component.*;

class Flow
{
    /**
        Returns a Trigger that runs the given callback when started.
        The callback is given an emit callback to emit signals.
    **/
    public static function getTrigger<T>(startFn:((T) -> Void) -> Void):Trigger<T>
    {
        return new TriggerWrapper(startFn);
    }

    /**
        Returns a Component that runs the given callback when signals are received,
        and then emits out signals returned from the callback.
    **/
    public static function getComponent<T, V>(fn:(T) -> Array<V>):Component<T, V>
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
