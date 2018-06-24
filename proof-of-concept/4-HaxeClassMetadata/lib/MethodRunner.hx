import haxe.Constraints;
import domain.*;
import HelloWorld;

class MethodRunner {
    public function new()  {}

    public function runMethod(objectWithMetadata:Dynamic) {
        var metadata:Array<StreamMethod> = objectWithMetadata.getFunctions();

        var streamMethod = metadata[0];
        trace(Std.is(VoidDomain.instance, streamMethod.parameter));
        trace(Reflect.isFunction(streamMethod.method));

        streamMethod.method(VoidDomain.instance);
    }
}
