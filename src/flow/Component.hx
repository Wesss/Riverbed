package flow;


typedef Component0to1<O1> = {
    var out1(default, null): StreamOut<O1>;
};
typedef Component0to2<O1, O2> = Component0to1<O1> & {
    var out2(default, null): StreamOut<O2>;
};
typedef Component1to0<I1> = {
    var in1(default, null): StreamIn<I1>;
};
typedef Component2to0<I1, I2> = Component1to0<I1> & {
    var in2(default, null): StreamIn<I2>;
};
typedef Component1to1<I1, O1> = Component0to1<O1> & Component1to0<I1>;
typedef Component1to2<I1, O1, O2> = Component0to2<O1, O2> & Component1to0<I1>;
typedef Component2to1<I1, I2, O1> = Component0to1<O1> & Component2to0<I1, I2>;
typedef Component2to2<I1, I2, O1, O2> = Component0to2<O1, O2> & Component2to0<I1, I2>;

/**
    A component is a black box process that can process incoming signals
    and output new signals.
**/
class Component<I1, I2, O1, O2>
{
    public var in1(default, null):StreamIn<I1>;
    public var in2(default, null):StreamIn<I2>;
    public var out1(default, null):StreamOut<O1>;
    public var out2(default, null):StreamOut<O2>;

    public function new(
        fn1:(I1, (O1)->Void, (O2)->Void)->Void,
        fn2:(I2, (O1)->Void, (O2)->Void)->Void
    ) {
        out1 = new StreamOut();
        out2 = new StreamOut();
        in1 = new StreamIn((signal:I1) -> {
            fn1(signal, out1.emit, out2.emit);
        });
        in2 = new StreamIn((signal:I2) -> {
            fn2(signal, out1.emit, out2.emit);
        });
    }
}