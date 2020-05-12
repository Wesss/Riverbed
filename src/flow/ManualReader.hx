package flow;

import component.*;

/**
    A Component that stores all signals received for retrieval. Emits nothing.
**/
class ManualReader implements Consumer
{
    var consumer:Consumer;
    var seen:Array<Dynamic> = new Array<Dynamic>(); 

    public function new()
    {
        consumer = new ConsumerWrapper(store);
    }

    private function store(signal:Dynamic):Void
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
    public function process(signal:Dynamic):Void
    {
        consumer.process(signal);
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

