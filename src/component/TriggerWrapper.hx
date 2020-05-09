package component;

/**
    A Trigger is a black box process that once started, emits new signals.
**/
class TriggerWrapper implements Trigger
{
    var startFn:((Dynamic) -> Void) -> Void;
    var connectedComponents:Array<Component> = new Array<Component>();

    public function new (startFn:((Dynamic) -> Void) -> Void)
    {
        this.startFn = startFn;
    }

    public function connectTo(component:Component) 
    {
        connectedComponents.push(component);
    }

    public function start()
    {
        startFn(emitCallback);
    }

    private function emitCallback(signal:Dynamic):Void
    {
        for (component in connectedComponents) {
            component.process(signal);
        }
    }
}