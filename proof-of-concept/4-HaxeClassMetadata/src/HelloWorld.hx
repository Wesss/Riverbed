class HelloWorld {
    public function new() {}

    public function functionMetadata():Void->Void {
        return arbitraryMethod;
    }

    public function arbitraryMethod() {
        trace("Hello World from an arbitrary method");
    }
}
