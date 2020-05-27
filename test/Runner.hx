import flow.*;

class Runner {
    static function main() {
        utest.UTest.run([
            new StartEndTest(),
            new TypedTest(),
            new ConsumerTest(),
            new ComponentTest(),
            new FlowUtilTest()
        ]);
    }
}
