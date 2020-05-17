package flow;

/**
    An Emitter is able to emit signals to Receivers.
**/
interface Emitter<T>
{
    /**
        Hooks up the given component to receive all signals emitted.
    **/
    public function to(receiver:Receiver<T>):Void;

    /**
        Hooks up the given component to receive all signals emitted of the type it accepts.
    **/
    public function toFilterTypes<V>(receiver:Receiver<V>):Void;

    /**
        Emits the given signal to all connected receivers.
    **/
    public function emit(signal:T):Void;
}