package flow;

import flow.Consumer;


/**
    A unary type to represent the presense of a signal.
**/
class UnitSignal {
    static var inst(default, null):UnitSignal = null;
    private function new () {}
}

typedef Start<T> = StreamOut<T>;
typedef End<T> = StreamIn<T>;

class Flow {
    public static function getStart<T>():Start<T> {
        return new StreamOut<T>();
    }

    public static function getEnd<T>():End<T> {
        return new StreamIn<T>();
    }

    public static function getConsumer1<T>(fn:(T)->Void):Consumer1<T> {
        return getConsumer2(fn, null);
    }

    public static function getConsumer2<T, V>(fn1:(T)->Void, fn2:(V)->Void):Consumer2<T, V> {
        return getConsumer3(fn1, fn2, null);
    }

    public static function getConsumer3<T, V, W>(fn1:(T)->Void, fn2:(V)->Void, fn3:(W)->Void):Consumer2<T, V> {
        return getConsumer4(fn1, fn2, fn3, null);
    }

    public static function getConsumer4<T, V, W, X>(fn1:(T)->Void, fn2:(V)->Void, fn3:(W)->Void, fn4:(X)->Void):Consumer4<T, V, W, X> {
        return new Consumer<T, V, W, X>(fn1, fn2, fn3, fn4);
    }

    // /**
    //     Returns a Trigger that runs the given callback when started.
    //     The callback is given an emit callback to emit signals.
    // **/
    // public static function getTrigger<T>(startFn:((T) -> Void) -> Void):Trigger<T>
    // {
    //     return new TriggerWrapper(startFn);
    // }

    // /**
    //     Returns a Component that runs the given fn when signals are received,
    //     and then emits out signals returned from the callback.
    // **/
    // public static function getComponent<T, V>(fn:(T) -> Iterable<V>):Component<T, V>
    // {
    //     var fnWithCallback = (signal:T, emit:Array<(V) -> Void>) -> {
    //         var results = fn(signal);
    //         for (res in results) {
    //             emit[0](res);
    //         }
    //     }
    //     return getComponentUsingCallbacks(fnWithCallback);
    // }

    // /**
    //     Returns a Component that runs the given fn when signals are received,
    //     and then emits out signals called using the given emit callback.
    // **/
    // public static function getComponentUsingCallbacks<T, V>(fn:(T, Array<(V) -> Void>) -> Void, outStreamCount:Int = 1):Component<T, V>
    // {
    //     return new ComponentWrapper(fn, outStreamCount);
    // }

    // /**
    //     Returns a Consumer that runs the given callback when signals are received,
    //     and then emits out signals returned from the callback.
    // **/
    // public static function getConsumer<T>(fn:(T) -> Void):Consumer<T>
    // {
    //     return new ConsumerWrapper<T>(fn);
    // }
}
