package flow;

import flow.*;
import utest.*;

class ManualTest extends utest.Test {

	var emitter:ManualEmitter;
	var emitter2:ManualEmitter;
	var emitter3:ManualEmitter;
	var reader:ManualReader;
	var reader2:ManualReader;
	var reader3:ManualReader;

	public function setup() {
		emitter = Util.getManualEmitter();
		emitter2 = Util.getManualEmitter();
		emitter3 = Util.getManualEmitter();
		reader = Util.getManualReader();
		reader2 = Util.getManualReader();
		reader3 = Util.getManualReader();
	}

	public function testOneSignal() {
		emitter.to(reader);
		emitter.emit("TEST");
		Assert.same(["TEST"], reader.read());
	}

	public function testManySignals() {
		emitter.to(reader);
		emitter.emit("TEST");
		emitter.emit("TEST2");
		emitter.emit("TEST3");
		Assert.same(["TEST", "TEST2", "TEST3"], reader.read());
	}

	public function testManyEmitters() {
		emitter.to(reader);
		emitter2.to(reader);
		emitter3.to(reader);
		emitter3.emit("TEST");
		emitter2.emit("TEST2");
		emitter.emit("TEST3");
		Assert.same(["TEST", "TEST2", "TEST3"], reader.read());
	}

	public function testManyReaders() {
		emitter.to(reader);
		emitter.to(reader2);
		emitter.to(reader3);
		emitter.emit("TEST");
		Assert.same(["TEST"], reader.read());
		Assert.same(["TEST"], reader2.read());
		Assert.same(["TEST"], reader3.read());
	}

	public function testReadGivesLatestSignals() {
		emitter.to(reader);
		emitter.emit("TEST");
		emitter.emit("TEST2");
		Assert.same(["TEST", "TEST2"], reader.read());
		emitter.emit("TEST3");
		emitter.emit("TEST4");
		Assert.same(["TEST3", "TEST4"], reader.read());
	}

	public function testReceiveFrom() {
		reader.receiveFrom(emitter);
		emitter.emit("TEST");
		Assert.same(["TEST"], reader.read());
	}
}
