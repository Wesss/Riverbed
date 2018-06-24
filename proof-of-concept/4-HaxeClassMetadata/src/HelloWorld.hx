import haxe.Constraints;
import domain.*;

typedef StreamMethod = {
    parameter: Class<Dynamic>,
    method: Function
}
class HelloWorld {
    public function new() {}

    public function getFunctions():Array<StreamMethod> {
        return [
            {
                parameter: VoidDomain,
                method: arbitraryMethod
            }
        ];
    }

    public function arbitraryMethod(_:VoidDomain):VoidDomain {
        trace("Hello World from an arbitrary method");

        return _;
    }
}
