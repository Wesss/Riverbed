package component;

interface Trigger extends Emitter
{
    /**
        Starts this trigger.
    **/
    public function start():Void;
}