package flow;

import component.*;

/**
    A Component that stores all signals received for retrieval. Emits nothing.
**/
class ManualReader implements Consumer<Any>
{
    var consumer:Consumer<Any>;
    var seen:Array<Any> = new Array<Any>();

    public function new()
    {
        consumer = new ConsumerWrapper<Any>(store);
    }

    private function store(signal:Any):Void
    {
        seen.push(signal);
    }

    /**
        Hooks this up to receive signals from the given emitter.
    **/
    public function receiveFrom(emitter:Emitter)
    {
        consumer.receiveFrom(emitter);
    }

    /**
        Processes the given signal through this component.
    **/
    public function process(signal:Any):Void
    {
        consumer.process(signal);
    }

    /**
        Returns all signals received since the last read.
    **/
    public function read():Array<Any>
    {
        var result = seen;
        seen = new Array<Any>();
        return result;
    }
}

