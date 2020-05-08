import util.*;

class Runner {
    static function main() {
        utest.UTest.run([
            new ManualTest()
        ]);
    }
}
