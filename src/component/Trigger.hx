package component;

interface Trigger
{
    /**
        Hooks up the given component to received all signals emitted by this trigger.
    **/
    public function connectTo(component:Component):Void;

    /**
        Starts this trigger.
    **/
    public function start():Void;
}