package flow;

import flow.*;
import utest.*;

class TypedTest extends utest.Test {

	// public function testTypeToType() {
	// 	var emitter: ManualEmitter<String> = Util.getManualEmitter();
	// 	var reader: ManualReader<String> = Util.getManualReader();
	// 	var reader2: ManualReader<String> = Util.getManualReader();
	// 	emitter.toFilterTypes(reader);
	// 	emitter.to(reader2);
	// 	emitter.emit("TEST");
	// 	Assert.same(["TEST"], reader.read());
	// 	Assert.same(["TEST"], reader2.read());
	// }

	// public function testChildToParent() {
	// 	var emitter: ManualEmitter<TestChild> = Util.getManualEmitter();
	// 	var reader: ManualReader<TestParent> = Util.getManualReader();
	// 	var reader2: ManualReader<TestParent> = Util.getManualReader();
	// 	emitter.toFilterTypes(reader);
	// 	// todo wesd this should be okay
	// 	emitter.to(reader2);
	// 	var signal = new TestChild();
	// 	emitter.emit(signal);
	// 	Assert.same([signal], reader.read(), false);
	// 	// Assert.same([signal], reader2.read(), false);
	// }

	// public function testParentToChild() {
	// 	var emitter: ManualEmitter<TestParent> = Util.getManualEmitter();
	// 	var reader: ManualReader<TestChild> = Util.getManualReader();
	// 	emitter.toFilterTypes(reader);
	// 	// todo wesd this should compile error
	// 	// emitter.to(reader);
	// 	var signalP = new TestParent();
	// 	var signalC = new TestChild();
	// 	var signalCAsP : TestParent = new TestChild();
	// 	emitter.emit(signalP);
	// 	emitter.emit(signalC);
	// 	emitter.emit(signalCAsP);
	// 	Assert.same([signalC, signalCAsP], reader.read(), false);
	// }

	// public function testAnyToAny() {
	// 	var emitter: ManualEmitter<Any> = Util.getManualEmitter();
	// 	var reader: ManualReader<Any> = Util.getManualReader();
	// 	var reader2: ManualReader<Any> = Util.getManualReader();
	// 	emitter.toFilterTypes(reader);
	// 	emitter.to(reader2);
	// 	emitter.emit("TEST");
	// 	emitter.emit(3);
	// 	Assert.same(["TEST", 3], reader.read());
	// 	Assert.same(["TEST", 3], reader2.read());
	// }

	// public function testTypeToAny() {
	// 	var emitter: ManualEmitter<Int> = Util.getManualEmitter();
	// 	var reader: ManualReader<Any> = Util.getManualReader();
	// 	var reader2: ManualReader<Any> = Util.getManualReader();
	// 	emitter.toFilterTypes(reader);
	// 	// todo wesd this should be okay
	// 	// emitter.to(reader2);
	// 	emitter.emit(3);
	// 	Assert.same([3], reader.read());
	// 	// Assert.same([3], reader2.read());
	// }

	// public function testAnyToType() {
	// 	var emitter: ManualEmitter<Any> = Util.getManualEmitter();
	// 	var reader: ManualReader<Int> = Util.getManualReader();
	// 	emitter.toFilterTypes(reader);
	// 	// todo wesd this should compile error
	// 	// emitter.to(reader);
	// 	emitter.emit(4);
	// 	emitter.emit("Hello");
	// 	var intAsAny:Any = 10;
	// 	emitter.emit(intAsAny);
	// 	Assert.same([4, 10], reader.read());
	// }

	// public function testTypeReceiveType() {
	// 	var emitter: ManualEmitter<String> = Util.getManualEmitter();
	// 	var reader: ManualReader<String> = Util.getManualReader();
	// 	var reader2: ManualReader<String> = Util.getManualReader();
	// 	reader.receiveFromFilterTypes(emitter);
	// 	reader2.receiveFrom(emitter);
	// 	emitter.emit("TEST");
	// 	Assert.same(["TEST"], reader.read());
	// 	Assert.same(["TEST"], reader2.read());
	// }

	// public function testParentReceiveChilde() {
	// 	var emitter: ManualEmitter<TestChild> = Util.getManualEmitter();
	// 	var reader: ManualReader<TestParent> = Util.getManualReader();
	// 	var reader2: ManualReader<TestParent> = Util.getManualReader();
	// 	reader.receiveFromFilterTypes(emitter);
	// 	// todo wesd this should be okay
	// 	// reader2.receiveFrom(emitter);
	// 	var signal = new TestChild();
	// 	emitter.emit(signal);
	// 	Assert.same([signal], reader.read(), false);
	// 	// Assert.same([signal], reader2.read(), false);
	// }

	// public function testChildReceivePArent() {
	// 	var emitter: ManualEmitter<TestParent> = Util.getManualEmitter();
	// 	var reader: ManualReader<TestChild> = Util.getManualReader();
	// 	reader.receiveFromFilterTypes(emitter);
	// 	// todo wesd this should compile error
	// 	// reader.receiveFrom(emitter);
	// 	var signalP = new TestParent();
	// 	var signalC = new TestChild();
	// 	var signalCAsP : TestParent = new TestChild();
	// 	emitter.emit(signalP);
	// 	emitter.emit(signalC);
	// 	emitter.emit(signalCAsP);
	// 	Assert.same([signalC, signalCAsP], reader.read(), false);
	// }
}

class TestParent { public function new() {} }
class TestChild extends TestParent { public function new() { super(); } }