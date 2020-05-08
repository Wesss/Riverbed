package component;

interface ITrigger
{
    public function connectTo(component:IComponent):Void;

    public function start():Void;
}