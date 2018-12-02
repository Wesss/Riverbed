import unitTest.UnitTestStubTest;

class Runner {
    static function main() {
        var testRunner = new haxe.unit.TestRunner();

        // add new TestCases here
        testRunner.add(new UnitTestStubTest());

        testRunner.run();
    }
}
