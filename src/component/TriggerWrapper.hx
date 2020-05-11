package component;

/**
    A Trigger is a black box process that once started, emits new signals.
**/
class TriggerWrapper implements Trigger
{
    var startFn:((Dynamic) -> Void) -> Void;
    var emitter:Emitter;

    public function new (startFn:((Dynamic) -> Void) -> Void)
    {
        this.startFn = startFn;
        this.emitter = new EmitterWrapper();
    }

    public function to(receiver:Receiver) 
    {
        emitter.to(receiver);
    }

    public function start()
    {
        startFn(emit);
    }

    public function emit(signal:Dynamic):Void
    {
        emitter.emit(signal);
    }
}