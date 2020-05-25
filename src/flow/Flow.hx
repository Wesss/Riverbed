package flow;

import flow.Component;
import flow.Consumer;

/**
    A unary type to represent the presense of a signal.
**/
class UnitSignal {
    public static var inst(default, null):UnitSignal = null;
    private function new () {}
}

typedef Start<T> = StreamOut<T>;
typedef End<T> = StreamIn<T>;

class Flow {
    public static function getStart<T>():Start<T> {
        return new StreamOut<T>();
    }

    public static function getEnd<T>():End<T> {
        return new StreamIn<T>(null);
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

    public static function getComponent1to1<I1, O1>(
        fn1:(I1, (O1)->Void)->Void
    ):Component1to1<I1, O1> {
        return getComponent2to1(fn1, null);
    }

    public static function getComponent2to1<I1, I2, O1>(
        fn1:(I1, (O1)->Void)->Void,
        fn2:(I2, (O1)->Void)->Void
    ):Component2to1<I1, I2, O1> {
        var newFn1 = (signal:I1, emit1:O1->Void, _:Any->Void) -> {
            fn1(signal, emit1);
        };
        var newFn2 = (signal:I2, emit1:O1->Void, _:Any->Void) -> {
            fn2(signal, emit1);
        };
        return getComponent2to2(newFn1, newFn2);
    }

    public static function getComponent1to2<I1, O1, O2>(
        fn1:(I1, (O1)->Void, (O2)->Void)->Void
    ):Component1to2<I1, O1, O2> {
        return getComponent2to2(fn1, null);
    }

    public static function getComponent2to2<I1, I2, O1, O2>(
        fn1:(I1, (O1)->Void, (O2)->Void)->Void,
        fn2:(I2, (O1)->Void, (O2)->Void)->Void
    ):Component2to2<I1, I2, O1, O2> {
        return new Component<I1, I2, O1, O2>(fn1, fn2);
    }
}
