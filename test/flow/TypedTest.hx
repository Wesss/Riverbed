package flow;

import flow.Flow;
import flow.*;
import utest.*;

class TestParent { public function new() {} }
class TestChild extends TestParent { public function new() { super(); } }

class TypedTest extends utest.Test {

	// public function testChildToParent() {
	// 	var start:Start<TestChild> = Flow.getStart();
	// 	var end:End<TestParent> = Flow.getEnd();
	// 	end.accumulate(true);
	// 	// todo wesd this should be okay
	// 	// start.to(end);
	// 	// end.readFrom(start);
	// 	var signal = new TestChild();
	// 	start.emit(signal);
	// 	// Assert.same([signal], end.getSignals(), false);
	// }

	// public function testParentToChild() {
	// }

	// public function testAnyToAny() {
	// }

	// public function testTypeToAny() {
	// }

	// public function testAnyToType() {
	// }

	// public function testTypeReceiveType() {
	// }

	// public function testParentReceiveChilde() {
	// }

	// public function testChildReceivePArent() {
	// }
}