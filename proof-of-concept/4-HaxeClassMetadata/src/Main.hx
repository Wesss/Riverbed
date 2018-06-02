class Main {
    static public function main():Void {
        var methodRunner = new MethodRunner();
        var objectWithMetadata = new HelloWorld();

        methodRunner.runMethod(objectWithMetadata);
    }
}
