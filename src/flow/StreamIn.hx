package flow;

/**
    todo docs
**/
class StreamIn<T>
{
    var fn:(T)->Void;
    var accumulating:Bool = false;
    var collectedSignals:Array<T> = new Array<T>();

    public function new (fn:(T)->Void) {
        this.fn = fn;
        if (fn == null) {
            this.fn = (arg:T) -> {};
        }
    }

    /**
        
    **/
    public function readFrom(streamOut:StreamOut<T>) {
        streamOut.to(this);
    }

    /**
        Processes the given signal through connected components
    **/
    public function process(signal:T):Void {
        if (accumulating) {
            collectedSignals.push(signal);
        } else {
            fn(signal);
        }
    }

    /**
        If true, sets this stream to instead accumulate signals instead of sending them off to connected components.
    **/
    public function accumulate(acc:Bool):Void {
        accumulating = acc;
    }

    /**
        Returns all signals accumulated while 'accumulate' was set to true.
    **/
    public function getSignals():Iterable<T> {
        var res = collectedSignals;
        collectedSignals = [];
        return res;
    }
}