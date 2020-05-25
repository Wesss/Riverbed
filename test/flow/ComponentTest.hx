package flow;

import flow.Flow;
import utest.*;

class ComponentTest extends utest.Test {

	var start:Start<String>;

	public function setup() {
		start = Flow.getStart();
	}

	// 	trace(toLower);
	// 	trace(reader);
	// 	toLower.to(reader);
	// }

	// public function testOneSignal() {
	// 	emitter.emit("TEST");
	// 	Assert.same(["test"], reader.read());
	// }

	// public function testManySignals() {
	// 	emitter.emit("TEST");
	// 	emitter.emit("TEST2");
	// 	emitter.emit("TEST3");
	// 	var res = reader.read();
	// 	Assert.same(["test", "test2", "test3"], res);
	// }
}