package flow;

/**
    A Trigger is a black box process that once started, emits new signals.
**/
interface Trigger<T> extends Emitter<T>
{
    /**
        Starts this trigger.
    **/
    public function start():Void;
}