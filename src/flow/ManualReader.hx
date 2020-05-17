package flow;

import component.*;

/**
    A Component that stores all signals received for retrieval. Emits nothing.
**/
class ManualReader<T> implements Consumer<T>
{
    // todo wesd make manual reader generic, test that only vals of given type are passed in.
    var consumer:Consumer<T>;
    var seen:Array<T> = new Array<T>();

    public function new()
    {
        consumer = new ConsumerWrapper<T>(store);
    }

    private function store(signal:T):Void
    {
        seen.push(signal);
    }

    /**
        Hooks this up to receive signals from the given emitter.
    **/
    public function receiveFrom(emitter:Emitter<T>)
    {
        consumer.receiveFrom(emitter);
    }

    /**
        Hooks this up to receive signals from the given emitter.
    **/
    public function receiveFromFilterTypes<V>(emitter:Emitter<V>)
    {
        consumer.receiveFromFilterTypes(emitter);
    }

    /**
        Processes the given signal through this component.
    **/
    public function process(signal:T):Void
    {
        consumer.process(signal);
    }

    /**
        Returns all signals received since the last read.
    **/
    public function read():Array<T>
    {
        var result = seen;
        seen = new Array<T>();
        return result;
    }
}

