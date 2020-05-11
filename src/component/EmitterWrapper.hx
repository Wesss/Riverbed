package component;

/**
    A Trigger is a black box process that once started, emits new signals.
**/
class EmitterWrapper implements Emitter
{
    var connectedTo:Array<Receiver> = new Array<Receiver>();

    public function new()
    {

    }

    public function to(receiver:Receiver) 
    {
        connectedTo.push(receiver);
    }

    public function emit(signal:Dynamic)
    {
        for (receiver in connectedTo) {
            receiver.process(signal);
        }
    }
}