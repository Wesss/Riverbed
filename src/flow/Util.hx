package flow;

import component.*;

class Util
{
    public static function getManualEmitter<T>():ManualEmitter<T>
    {
        return new ManualEmitter<T>();
    }

    public static function getManualReader<T>():ManualReader<T>
    {
        return new ManualReader<T>();
    }

    public static function getPrintConsumer():Consumer<Any>
    {
        return Flow.getConsumer((signal:Any) -> trace(signal));
    }
}
