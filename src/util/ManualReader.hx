package util;

import component.*;

/**
    A Component that stores all signals received for retrieval. Emits nothing.
**/
class ManualReader implements Component
{
    var component:Component;
    var seen:Array<Dynamic> = new Array<Dynamic>(); 

    public function new()
    {
        component = Flow.createComponent(store);
    }

    private function store(signal:Dynamic):Array<Dynamic>
    {
        seen.push(signal);
        return Flow.EMPTY_RETURN;
    }

    public function connectTo(component:Component)
    {
        this.component.connectTo(component);
    }

    public function process(signal:Dynamic):Void
    {
        this.component.process(signal);
    }

    /**
        Returns all signals received since the last read.
    **/
    public function read():Array<Dynamic>
    {
        var result = seen;
        seen = new Array<Dynamic>();
        return result;
    }
}

