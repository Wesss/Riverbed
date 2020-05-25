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
}