package flow;

class Util
{
    public static function createManualEmitter():ManualEmitter
    {
        return new ManualEmitter();
    }

    public static function createManualReader():ManualReader
    {
        return new ManualReader();
    }
}
