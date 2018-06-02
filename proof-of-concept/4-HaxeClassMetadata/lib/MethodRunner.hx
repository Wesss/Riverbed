import haxe.Constraints;
import domain.*;

class MethodRunner {
    public function new()  {}

    public function runMethod(objectWithMetadata:Dynamic) {
        var metadata:Map<Domain, Function> = objectWithMetadata.functionMetadata();

        var func = metadata.get(VoidDomain.instance);
        func(VoidDomain.instance);
    }
}
