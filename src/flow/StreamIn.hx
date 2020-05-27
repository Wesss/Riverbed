package flow;

/**
    todo docs
    todo wesd hide 'protected' functions with start/end typedefs
**/
class StreamIn<T>
{
    var fn:(T)->Void;
    var accumulating:Bool = false;
    var collectedSignals:Array<T> = new Array<T>();

    public function new (fn:(T)->Void) {
        onProcess(fn);
    }

    /**
        
    **/
    public function readFrom<V:T>(streamOut:StreamOut<V>) {
        streamOut.to(cast this);
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
        Processes the given signal through connected components
    **/
    public function onProcess(fn:(T)->Void):Void {
        this.fn = fn;
        if (fn == null) {
            this.fn = (arg:T) -> {};
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