package flow;

import component.*;

/**
    A Trigger that isn't started, but rather triggers off of a manually invoked `emit` method
**/
class ManualEmitter implements Emitter
{
    var emitter:Emitter;

    public function new ()
    {
        emitter = new EmitterWrapper();
    }

    /**
        Emits the given signal to all connected receivers.
    **/
    public function emit(signal:Dynamic)
    {
        emitter.emit(signal);
    }

    /**
        Hooks up the given component to receive all signals emitted.
    **/
    public function to(receiver:Receiver)
    {
        emitter.to(receiver);
    }
}
