package flow;

/**
    todo docs
**/
class StreamOut<T>
{
    var connectedTo:Array<StreamIn<T>> = new Array<StreamIn<T>>();

    public function new() {

    }

    /**
        
    **/
    public function to(streamIn:StreamIn<T>):Void {
        connectedTo.push(streamIn);
    }

    /**
        
    **/
    public function emit(signal:T):Void {
        for (stream in connectedTo) {
            stream.process(signal);
        }
    }

    /**
        Debug prints outputed signals before emitting them outward.
    **/
    public function debug(key:String = null, fn:T->String = null) {
        connectedTo.insert(0, FlowUtil.tracer(key, fn).in1);
    }
}