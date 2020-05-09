package util;

import component.*;

/**
    A Trigger that isn't started, but rather triggers off of a manually invoked `emit` method
**/
class ManualTrigger implements Trigger
{
    var trigger:Trigger;
    var emitCallback:(Dynamic) -> Void;

    public function new ()
    {
        trigger = Flow.createTrigger(innerStart);
        trigger.start();
    }

    private function innerStart(emitCallback:(Dynamic) -> Void):Void
    {
        this.emitCallback = emitCallback;
    }

	/**
		Throws `"Not Implemented"`
	**/
    public function start():Void
    {
        throw "Not Implemented";
    }

	/**
		Triggers all connected components with the given signal.
	**/
    public function emit(signal:Dynamic)
    {
        this.emitCallback(signal);
    }

    public function connectTo(component:Component)
    {
        trigger.connectTo(component);
    }
}
