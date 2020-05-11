package flow;

import component.*;

/**
    A Component that stores all signals received for retrieval. Emits nothing.
**/
class ManualReader implements Receiver
{
    var receiver:Receiver;
    var seen:Array<Dynamic> = new Array<Dynamic>(); 

    public function new()
    {
        // todo wesd rework to use a receiver wrapper?
        receiver = new ComponentWrapper(store);
    }

    private function store(signal:Dynamic):Array<Dynamic>
    {
        seen.push(signal);
        return Flow.EMPTY_RETURN;
    }

    public function receiveFrom(emitter:Emitter)
    {
        receiver.receiveFrom(emitter);
    }

    public function process(signal:Dynamic):Void
    {
        receiver.process(signal);
    }

    /**
        Returns all signals received since the last read.
    **/
    public function read():Array<Dynamic>
    {
        var result = seen;
        seen = new Array<Dynamic>();
        return result;
    }
}

