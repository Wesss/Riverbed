package component;

interface Component
{
    /**
        Hooks up the given component to received all signals emitted by this component.
    **/
    public function connectTo(component:Component):Void;
    
    /**
        Processes the given signal through this component.
    **/
    public function process(signal:Dynamic):Void;
}