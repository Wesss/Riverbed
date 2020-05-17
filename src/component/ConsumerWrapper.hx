package component;

import flow.*;

class ConsumerWrapper<T> implements Consumer<T>
{
    var fn:(T) -> Void;

    public function new (fn:(T) -> Void)
    {
        this.fn = fn;
    }

    public function receiveFrom(emitter:Emitter<T>)
    {
        emitter.to(this);
    }

    public function receiveFromFilterTypes<V>(emitter:Emitter<V>)
    {
        emitter.toFilterTypes(this);
    }

    public function process(signal:T)
    {
        fn(signal);
    }
}