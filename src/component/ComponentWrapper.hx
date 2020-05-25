package component;

import flow.*;

class ComponentWrapper<T, V> implements Component<T, V>
{
    var fn:(T,  Array<(V) -> Void>) -> Void;
    var emitters:Array<Emitter<V>>;
    var callbacks:Array<(V) -> Void>;

    public function new (fn:(T, Array<(V) -> Void>) -> Void, emitCallbackCnt:Int = 1)
    {
        this.fn = fn;
        emitters = [];
        callbacks = [];
        for (i in 0...emitCallbackCnt) {
            emitters.push(new EmitterWrapper());
            callbacks.push((arg:V)-> {
                emitters[i].emit(arg);
            });
        }
    }

    public function to(receiver:Receiver<V>, outStream:Int = 0)
    {
        this.emitters[outStream].to(receiver);
    }

    public function toFilterTypes<U>(receiver:Receiver<U>, outStream:Int = 0)
    {
        this.emitters[outStream].toFilterTypes(receiver);
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
        throw "Not implemented";
    }

    public function process(signal:T)
    {
        fn(signal, callbacks);
    }
}