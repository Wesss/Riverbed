package component;

/**
    A Trigger is a black box process that once started, emits new signals.
**/
interface Trigger extends Emitter
{
    /**
        Starts this trigger.
    **/
    public function start():Void;
}