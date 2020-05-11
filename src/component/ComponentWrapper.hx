package component;

/**
    A component is a black box process that can receive signals emitted by other components and triggers
    and emit new signals.
**/
class ComponentWrapper implements Component implements Receiver
{
    var fn:(Dynamic) -> Array<Dynamic>;
    var emitter:Emitter;

    public function new (fn:(Dynamic) -> Array<Dynamic>)
    {
        this.fn = fn;
    }

    public function to(receiver:Receiver) 
    {
        this.emitter.to(receiver);
    }

    public function receiveFrom(emitter:Emitter)
    {
        emitter.to(this);
    }

    public function emit(signal:Dynamic):Void
    {
        emitter.emit(signal);
    }

    public function process(signal:Dynamic)
    {
        var results = fn(signal);
        for (res in results) {
            emit(res);
        }
    }
}