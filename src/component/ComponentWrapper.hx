package component;

import flow.*;

class ComponentWrapper<T, V> implements Component<T, V>
{
    var fn:(T) -> Array<V>;
    var emitter:Emitter<V>;

    public function new (fn:(T) -> Array<V>)
    {
        this.fn = fn;
    }

    public function to(receiver:Receiver<V>)
    {
        this.emitter.to(receiver);
    }

    public function toFilterTypes<U>(receiver:Receiver<U>)
    {
        this.emitter.toFilterTypes(receiver);
    }

    public function receiveFrom(emitter:Emitter<T>)
    {
        emitter.to(this);
    }

    public function receiveFromFilterTypes<U>(emitter:Emitter<U>)
    {
        emitter.toFilterTypes(this);
    }

    public function emit(signal:V):Void
    {
        emitter.emit(signal);
    }

    public function process(signal:T)
    {
        var results = fn(signal);
        for (res in results) {
            emit(res);
        }
    }
}