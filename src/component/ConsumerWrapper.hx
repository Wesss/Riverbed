package component;

class ConsumerWrapper<T> implements Consumer<T>
{
    var fn:(T) -> Void;

    public function new (fn:(T) -> Void)
    {
        this.fn = fn;
    }

    public function receiveFrom(emitter:Emitter)
    {
        emitter.to(cast this);
    }

    public function process(signal:T)
    {
        fn(signal);
    }
}