// @:keep // <-- Avoid dead code elimination
class MethodRunner {
    public function new()  {}

    public function runMethod(objectWithMetadata:Dynamic) {
        var method = objectWithMetadata.functionMetadata();

        method();
    }
}
