@:generic
class MyGeneric<T>
{
    public function new (fn:T)
    {
        trace(fn);
    }
}

class Repro
{
    static function main()
    {
        var tracer = getTracer();
    }

    public static function getTracer():MyGeneric<Int>
    {
        var arg:Int = 3;
        return getGeneric(Int);
    }

    @:generic
    public static function getGeneric<T>(T):MyGeneric<T>
    {
        return new MyGeneric(T);
    }
}