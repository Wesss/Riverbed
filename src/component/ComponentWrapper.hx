package component;

class ComponentWrapper<T> implements Component<T>
{
    var fn:(T) -> Array<Any>;
    var emitter:Emitter;

    public function new (fn:(T) -> Array<Any>)
    {
        this.fn = fn;
    }

    public function to(receiver:Receiver<Any>)
    {
        this.emitter.to(receiver);
    }

    public function receiveFrom(emitter:Emitter)
    {
        emitter.to(cast this);
    }

    public function emit(signal:Any):Void
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