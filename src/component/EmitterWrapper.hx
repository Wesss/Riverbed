package component;

class EmitterWrapper implements Emitter
{
    var connectedTo:Array<Receiver<Any>> = new Array<Receiver<Any>>();

    public function new()
    {

    }

    public function to<V>(receiver:Receiver<Any>)
    {
        connectedTo.push(cast receiver);
    }

    public function emit(signal:Any)
    {
        for (receiver in connectedTo) {
            receiver.process(signal);
        }
    }
}