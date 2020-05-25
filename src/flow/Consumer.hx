package flow;

typedef Consumer1<T> = {
    var input1(default, null): StreamIn<T>;
};
typedef Consumer2<T, V> = {
    var input1(default, null): StreamIn<T>;
    var input2(default, null): StreamIn<V>;
};
typedef Consumer3<T, V, W> = {
    var input1(default, null): StreamIn<T>;
    var input2(default, null): StreamIn<V>;
    var input3(default, null): StreamIn<W>;
};
typedef Consumer4<T, V, W, X> = Consumer<T, V, W, X>;

/**
    A Consumer is a black box process that processes incoming signals.
**/
class Consumer<T, V, W, X>
{
    public var input1(default, null):StreamIn<T>;
    public var input2(default, null):StreamIn<V>;
    public var input3(default, null):StreamIn<W>;
    public var input4(default, null):StreamIn<X>;

    public function new(
        fn1:(T)->Void, fn2:(V)->Void, fn3:(W)->Void, fn4:(X)->Void
    ) {
        input1 = new StreamIn(fn1);
        input2 = new StreamIn(fn2);
        input3 = new StreamIn(fn3);
        input4 = new StreamIn(fn4);
    }
}