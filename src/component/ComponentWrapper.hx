package component;

/**
    A component is a black box process that can receive signals emitted by other components and triggers
    and emit new signals.
**/
class ComponentWrapper implements Component
{
    var fn:(Dynamic) -> Array<Dynamic>;
    var connectedComponents:Array<Component> = new Array<Component>();

    public function new (fn:(Dynamic) -> Array<Dynamic>)
    {
        this.fn = fn;
    }

    public function connectTo(component:Component) 
    {
        connectedComponents.push(component);
    }

    public function process(signal:Dynamic)
    {
        var results = fn(signal);
        for (component in connectedComponents) {
            for (res in results) {
                component.process(res);
            }
        }
    }
}