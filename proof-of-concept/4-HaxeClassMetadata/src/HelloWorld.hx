import haxe.Constraints;
import domain.*;

class HelloWorld {
    public function new() {}

    public function functionMetadata():Map<Domain, Function> {
        // var map:Map<Class<Dynamic>, Function> = new Map();
        // map.set(VoidDomain, arbitraryMethod);
        return [VoidDomain.instance => arbitraryMethod];
    }

    public function arbitraryMethod(_:VoidDomain):VoidDomain {
        trace("Hello World from an arbitrary method");

        return _;
    }
}
