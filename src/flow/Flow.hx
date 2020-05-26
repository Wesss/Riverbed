package flow;

import flow.Component;

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

    public static function getConsumer1<I1>(
        fn1
    ):Consumer1<I1> {
        return getConsumer2(fn1, null);
    }

    public static function getConsumer2<I1, I2>(
        fn1, fn2
    ):Consumer2<I1, I2> {
        return getConsumer3(fn1, fn2, null);
    }

    public static function getConsumer3<I1, I2, I3>(
        fn1, fn2, fn3
    ):Consumer3<I1, I2, I3> {
        return getConsumer4(fn1, fn2, fn3, null);
    }

    public static function getComponent1to1<I1, O1>(
        fn1
    ):Component1to1<I1, O1> {
        return getComponent2to1(fn1, null);
    }

    public static function getComponent2to1<I1, I2, O1>(
        fn1, fn2
    ):Component2to1<I1, I2, O1> {
        return getComponent3to1(fn1, fn2, null);
    }

    public static function getComponent3to1<I1, I2, I3, O1>(
        fn1, fn2, fn3
    ):Component3to1<I1, I2, I3, O1> {
        return getComponent4to1(fn1, fn2, fn3, null);
    }

    public static function getComponent1to2<I1, O1, O2>(
        fn1
    ):Component1to2<I1, O1, O2> {
        return getComponent2to2(fn1, null);
    }

    public static function getComponent2to2<I1, I2, O1, O2>(
        fn1, fn2
    ):Component2to2<I1, I2, O1, O2> {
        return getComponent3to2(fn1, fn2, null);
    }

    public static function getComponent3to2<I1, I2, I3, O1, O2>(
        fn1, fn2, fn3
    ):Component3to2<I1, I2, I3, O1, O2> {
        return getComponent4to2(fn1, fn2, fn3, null);
    }

    public static function getComponent1to3<I1, O1, O2, O3>(
        fn1
    ):Component1to3<I1, O1, O2, O3> {
        return getComponent2to3(fn1, null);
    }

    public static function getComponent2to3<I1, I2, O1, O2, O3>(
        fn1, fn2
    ):Component2to3<I1, I2, O1, O2, O3> {
        return getComponent3to3(fn1, fn2, null);
    }

    public static function getComponent3to3<I1, I2, I3, O1, O2, O3>(
        fn1, fn2, fn3
    ):Component3to3<I1, I2, I3, O1, O2, O3> {
        return getComponent4to3(fn1, fn2, fn3, null);
    }

    public static function getConsumer4<I1, I2, I3, I4>(
        fn1, fn2, fn3, fn4
    ):Consumer4<I1, I2, I3, I4> {
        var newFn1 = (signal, _) -> {
            fn1(signal);
        };
        var newFn2 = (signal, _) -> {
            fn2(signal);
        };
        var newFn3 = (signal, _) -> {
            fn3(signal);
        };
        var newFn4 = (signal, _) -> {
            fn4(signal);
        };
        return getComponent4to1(newFn1, newFn2, newFn3, newFn4);
    }

    public static function getComponent4to1<I1, I2, I3, I4, O1>(
        fn1, fn2, fn3, fn4
    ):Component4to1<I1, I2, I3, I4, O1> {
        var newFn1 = (signal, emit1, _) -> {
            fn1(signal, emit1);
        };
        var newFn2 = (signal, emit1, _) -> {
            fn2(signal, emit1);
        };
        var newFn3 = (signal, emit1, _) -> {
            fn3(signal, emit1);
        };
        var newFn4 = (signal, emit1, _) -> {
            fn4(signal, emit1);
        };
        return getComponent4to2(newFn1, newFn2, newFn3, newFn4);
    }

    public static function getComponent4to2<I1, I2, I3, I4, O1, O2>(
        fn1, fn2, fn3, fn4
    ):Component4to2<I1, I2, I3, I4, O1, O2> {
        var newFn1 = (signal, emit1, emit2, _) -> {
            fn1(signal, emit1, emit2);
        };
        var newFn2 = (signal, emit1, emit2, _) -> {
            fn2(signal, emit1, emit2);
        };
        var newFn3 = (signal, emit1, emit2, _) -> {
            fn3(signal, emit1, emit2);
        };
        var newFn4 = (signal, emit1, emit2, _) -> {
            fn4(signal, emit1, emit2);
        };
        return getComponent4to3(newFn1, newFn2, newFn3, newFn4);
    }

    public static function getComponent4to3<I1, I2, I3, I4, O1, O2, O3>(
        fn1, fn2, fn3, fn4
    ):Component4to3<I1, I2, I3, I4, O1, O2, O3> {
        var newFn1 = (signal, emit1, emit2, emit3, _) -> {
            fn1(signal, emit1, emit2, emit3);
        };
        var newFn2 = (signal, emit1, emit2, emit3, _) -> {
            fn2(signal, emit1, emit2, emit3);
        };
        var newFn3 = (signal, emit1, emit2, emit3, _) -> {
            fn3(signal, emit1, emit2, emit3);
        };
        var newFn4 = (signal, emit1, emit2, emit3, _) -> {
            fn4(signal, emit1, emit2, emit3);
        };
        return getComponent4to4(newFn1, newFn2, newFn3, newFn4);
    }

    public static function getComponent4to4<I1, I2, I3, I4, O1, O2, O3, O4>(
        fn1:(I1, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void,
        fn2:(I2, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void,
        fn3:(I3, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void,
        fn4:(I4, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void
    ):Component4to4<I1, I2, I3, I4, O1, O2, O3, O4> {
        return new Component<I1, I2, I3, I4, O1, O2, O3, O4>(fn1, fn2, fn3, fn4);
    }
}
