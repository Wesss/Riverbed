package util;

class Util
{
    public static function createManualTrigger():ManualTrigger
    {
        return new ManualTrigger();
    }

    public static function createManualReader():ManualReader
    {
        return new ManualReader();
    }
}
