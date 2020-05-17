package component;

import flow.*;

class EmitterWrapper<T> implements Emitter<T>
{
    var connectedTo:Array<Receiver<T>> = new Array<Receiver<T>>();

    public function new()
    {

    }

    public function to(receiver:Receiver<T>):Void
    {
        connectedTo.push(receiver);
    }

    public function toFilterTypes<V>(receiver:Receiver<V>)
    {
        throw "not implemented";
        // var filter: Component<T, V> = new ComponentWrapper((arg:T) -> {
        //     if (Std.is(arg, V)) {
        //         return [];
        //     }
        //     return [cast(arg, V)];
        // });

        // this.to(filter);
        // filter.to(receiver);
    }

    public function emit(signal:T)
    {
        for (receiver in connectedTo) {
            receiver.process(signal);
        }
    }
}