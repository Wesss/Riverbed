package component;

interface Emitter
{
    /**
        Hooks up the given component to receive all signals emitted.
    **/
    public function to(receiver:Receiver):Void;

    /**
        Emits the given signal to all connected receivers.
    **/
    public function emit(signal:Dynamic):Void;
}