package util;

import component.*;

class ManualTrigger implements ITrigger
{
    var trigger:Trigger;
    var emitCallback:(Dynamic) -> Void;

    public function new ()
    {
        trigger = new Trigger(innerStart);
        trigger.start();
    }

    public function innerStart(emitCallback:(Dynamic) -> Void):Void
    {
        this.emitCallback = emitCallback;
    }

    public function start():Void
    {
        return;
    }

    public function emit(domain:Dynamic)
    {
        emitCallback(domain);
    }

    public function connectTo(component:IComponent)
    {
        trigger.connectTo(component);
    }
}
