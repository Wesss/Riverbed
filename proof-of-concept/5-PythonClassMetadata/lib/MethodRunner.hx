package lib;

import haxe.Constraints;
import lib.domain.*;

typedef StreamMethod = {
    parameter: Class<Dynamic>,
    method: Function
}
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
