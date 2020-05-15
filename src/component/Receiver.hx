package component;

/**
    A Receiver is able to receiver signals from Emitters.
**/
interface Receiver<T>
{
    /**
        Hooks this up to receive signals from the given emitter.
    **/
    public function receiveFrom(emitter:Emitter):Void;

    /**
        Processes the given signal through this component.
    **/
    public function process(signal:T):Void;
}