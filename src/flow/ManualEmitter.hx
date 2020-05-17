package flow;

import component.*;

/**
    A Trigger that isn't started, but rather triggers off of a manually invoked `emit` method
**/
class ManualEmitter<T> implements Emitter<T>
{
    var emitter:Emitter<T>;

    public function new ()
    {
        emitter = new EmitterWrapper();
    }

    /**
        Emits the given signal to all connected receivers.
    **/
    public function emit(signal:T)
    {
        emitter.emit(signal);
    }

    /**
        Hooks up the given component to receive all signals emitted.
    **/
    public function to(receiver:Receiver<T>)
    {
        emitter.to(receiver);
    }

    /**
        Hooks up the given component to receive all signals emitted.
    **/
    public function toFilterTypes<V>(receiver:Receiver<V>)
    {
        emitter.toFilterTypes(receiver);
    }
}
