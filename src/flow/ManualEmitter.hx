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
		Triggers all connected components with the given signal.
	**/
    public function emit(signal:Dynamic)
    {
        emitter.emit(signal);
    }

    public function to(receiver:Receiver)
    {
        emitter.to(receiver);
    }
}
