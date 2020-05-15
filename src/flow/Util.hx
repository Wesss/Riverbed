package flow;

import component.*;

class Util
{
    public static function getManualEmitter():ManualEmitter
    {
        return new ManualEmitter();
    }

    public static function getManualReader():ManualReader
    {
        return new ManualReader();
    }

    public static function getPrintConsumer():Consumer<Any>
    {
        var fn:(Any) -> Void = (signal:Any) -> trace(signal);
        return Flow.getConsumer(fn);
    }
}
