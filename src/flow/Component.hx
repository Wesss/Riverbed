package flow;

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

    public function new(
        fn1:(I1, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void,
        fn2:(I2, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void,
        fn3:(I3, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void,
        fn4:(I4, (O1)->Void, (O2)->Void, (O3)->Void, (O4)->Void)->Void
    ) {
        out1 = new StreamOut();
        out2 = new StreamOut();
        out3 = new StreamOut();
        out4 = new StreamOut();
        // feed into each input the emit method of each output.
        in1 = new StreamIn((signal:I1) -> {
            fn1(signal, out1.emit, out2.emit, out3.emit, out4.emit);
        });
        in2 = new StreamIn((signal:I2) -> {
            fn2(signal, out1.emit, out2.emit, out3.emit, out4.emit);
        });
        in3 = new StreamIn((signal:I3) -> {
            fn3(signal, out1.emit, out2.emit, out3.emit, out4.emit);
        });
        in4 = new StreamIn((signal:I4) -> {
            fn4(signal, out1.emit, out2.emit, out3.emit, out4.emit);
        });
    }
}