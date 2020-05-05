import unitTest.UnitTestStubTest;

class Runner {
    static function main() {
        utest.UTest.run([
            new UnitTestStubTest()
        ]);
        // // add new TestCases here
        // testRunner.add(new UnitTestStubTest());

        // testRunner.run();
        // var exitCode = 0;
        // if (!testRunner.result.success) {
        //     exitCode = 1;
        // }
        // Sys.exit(exitCode);
    }
}
