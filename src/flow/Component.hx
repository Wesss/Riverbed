package flow;

import flow.Flow;

// expand out by inputs and outputs
typedef Consumer1<I1> = {
    var in1(default, null): StreamIn<I1>;
};
typedef Consumer2<I1, I2> = Consumer1<I1> & {
    var in2(default, null): StreamIn<I2>;
};
typedef Consumer3<I1, I2, I3> = Consumer2<I1, I2> & {
    var in3(default, null): StreamIn<I3>;
};
typedef Consumer4<I1, I2, I3, I4> = Consumer3<I1, I2, I3> & {
    var in4(default, null): StreamIn<I4>;
};
typedef Component0to1<O1> = {
    var out1(default, null): StreamOut<O1>;
};
typedef Component0to2<O1, O2> = Component0to1<O1> & {
    var out2(default, null): StreamOut<O2>;
};
typedef Component0to3<O1, O2, O3> = Component0to2<O1, O2> & {
    var out3(default, null): StreamOut<O3>;
};
typedef Component0to4<O1, O2, O3, O4> = Component0to3<O1, O2, O3> & {
    var out4(default, null): StreamOut<O4>;
};
// compose every combination
typedef Component1to1<I1, O1> = Component0to1<O1> & Consumer1<I1>;
typedef Component1to2<I1, O1, O2> = Component0to2<O1, O2> & Consumer1<I1>;
typedef Component1to3<I1, O1, O2, O3> = Component0to3<O1, O2, O3> & Consumer1<I1>;
typedef Component1to4<I1, O1, O2, O3, O4> = Component0to4<O1, O2, O3, O4> & Consumer1<I1>;
typedef Component2to1<I1, I2, O1> = Component0to1<O1> & Consumer2<I1, I2>;
typedef Component2to2<I1, I2, O1, O2> = Component0to2<O1, O2> & Consumer2<I1, I2>;
typedef Component2to3<I1, I2, O1, O2, O3> = Component0to3<O1, O2, O3> & Consumer2<I1, I2>;
typedef Component2to4<I1, I2, O1, O2, O3, O4> = Component0to4<O1, O2, O3, O4> & Consumer2<I1, I2>;
typedef Component3to1<I1, I2, I3, O1> = Component0to1<O1> & Consumer3<I1, I2, I3>;
typedef Component3to2<I1, I2, I3, O1, O2> = Component0to2<O1, O2> & Consumer3<I1, I2, I3>;
typedef Component3to3<I1, I2, I3, O1, O2, O3> = Component0to3<O1, O2, O3> & Consumer3<I1, I2, I3>;
typedef Component3to4<I1, I2, I3, O1, O2, O3, O4> = Component0to4<O1, O2, O3, O4> & Consumer3<I1, I2, I3>;
typedef Component4to1<I1, I2, I3, I4, O1> = Component0to1<O1> & Consumer4<I1, I2, I3, I4>;
typedef Component4to2<I1, I2, I3, I4, O1, O2> = Component0to2<O1, O2> & Consumer4<I1, I2, I3, I4>;
typedef Component4to3<I1, I2, I3, I4, O1, O2, O3> = Component0to3<O1, O2, O3> & Consumer4<I1, I2, I3, I4>;
typedef Component4to4<I1, I2, I3, I4, O1, O2, O3, O4> = Component0to4<O1, O2, O3, O4> & Consumer4<I1, I2, I3, I4>;

/**
    A component is a black box process that can process incoming signals
    and output new signals.
**/
class Component<I1, I2, I3, I4, O1, O2, O3, O4>
{
    public var in1(default, null):StreamIn<I1>;
    public var in2(default, null):StreamIn<I2>;
    public var in3(default, null):StreamIn<I3>;
    public var in4(default, null):StreamIn<I4>;
    public var out1(default, null):StreamOut<O1>;
    public var out2(default, null):StreamOut<O2>;
    public var out3(default, null):StreamOut<O3>;
    public var out4(default, null):StreamOut<O4>;

    private function new(
        in1, in2, in3, in4,
        out1, out2, out3, out4
    ) {
        this.in1 = in1;
        this.in2 = in2;
        this.in3 = in3;
        this.in4 = in4;
        this.out1 = out1;
        this.out2 = out2;
        this.out3 = out3;
        this.out4 = out4;
    }

    public static function fromStartEnd<I1, I2, I3, I4, O1, O2, O3, O4>(
        start1:Start<I1>, start2:Start<I2>, start3:Start<I3>, start4:Start<I4>,
        end1:End<O1>, end2:End<O2>, end3:End<O3>, end4:End<O4>
    ):Component<I1, I2, I3, I4, O1, O2, O3, O4> {
        var in1 = new StreamIn(signal -> {
            start1.emit(signal);
        });
        var in2 = new StreamIn(signal -> {
            start2.emit(signal);
        });
        var in3 = new StreamIn(signal -> {
            start3.emit(signal);
        });
        var in4 = new StreamIn(signal -> {
            start4.emit(signal);
        });
        var out1 = new StreamOut();
        if (end1 != null) {
            end1.onProcess(signal -> {
                out1.emit(signal);
            });
        }
        var out2 = new StreamOut();
        if (end2 != null) {
            end2.onProcess(signal -> {
                out2.emit(signal);
            });
        }
        var out3 = new StreamOut();
        if (end3 != null) {
            end3.onProcess(signal -> {
                out3.emit(signal);
            });
        }
        var out4 = new StreamOut();
        if (end4 != null) {
            end4.onProcess(signal -> {
                out4.emit(signal);
            });
        }

        return new Component(in1, in2, in3, in4, out1, out2, out3, out4);
    }

    public static function fromFns<I1, I2, I3, I4, O1, O2, O3, O4>(
        fn1:(I1, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void,
        fn2:(I2, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void,
        fn3:(I3, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void,
        fn4:(I4, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void
    ) {
        var out1 = new StreamOut();
        var out2 = new StreamOut();
        var out3 = new StreamOut();
        var out4 = new StreamOut();
        // feed into each input the emit method of each output.
        var in1 = new StreamIn((signal:I1) -> {
            fn1(signal, out1.emit, out2.emit, out3.emit, out4.emit);
        });
        var in2 = new StreamIn((signal:I2) -> {
            fn2(signal, out1.emit, out2.emit, out3.emit, out4.emit);
        });
        var in3 = new StreamIn((signal:I3) -> {
            fn3(signal, out1.emit, out2.emit, out3.emit, out4.emit);
        });
        var in4 = new StreamIn((signal:I4) -> {
            fn4(signal, out1.emit, out2.emit, out3.emit, out4.emit);
        });
        return new Component(in1, in2, in3, in4, out1, out2, out3, out4);
    }
}