package util;

import util.*;
import utest.*;

class ManualTest extends utest.Test {

	var trigger:ManualTrigger;
	var trigger2:ManualTrigger;
	var trigger3:ManualTrigger;
	var reader:ManualReader;
	var reader2:ManualReader;
	var reader3:ManualReader;

	public function setup() {
		trigger = Util.createManualTrigger();
		trigger2 = Util.createManualTrigger();
		trigger3 = Util.createManualTrigger();
		reader = Util.createManualReader();
		reader2 = Util.createManualReader();
		reader3 = Util.createManualReader();
	}

	public function testOneSignal() {
		trigger.connectTo(reader);
		trigger.emit("TEST");
		Assert.same(["TEST"], reader.read());
	}

	public function testManySignals() {
		trigger.connectTo(reader);
		trigger.emit("TEST");
		trigger.emit("TEST2");
		trigger.emit("TEST3");
		Assert.same(["TEST", "TEST2", "TEST3"], reader.read());
	}

	public function testManyTriggers() {
		trigger.connectTo(reader);
		trigger2.connectTo(reader);
		trigger3.connectTo(reader);
		trigger3.emit("TEST");
		trigger2.emit("TEST2");
		trigger.emit("TEST3");
		Assert.same(["TEST", "TEST2", "TEST3"], reader.read());
	}

	public function testManyReaders() {
		trigger.connectTo(reader);
		trigger.connectTo(reader2);
		trigger.connectTo(reader3);
		trigger.emit("TEST");
		Assert.same(["TEST"], reader.read());
		Assert.same(["TEST"], reader2.read());
		Assert.same(["TEST"], reader3.read());
	}

	public function testReadGivesLatestSignals() {
		trigger.connectTo(reader);
		trigger.emit("TEST");
		trigger.emit("TEST2");
		Assert.same(["TEST", "TEST2"], reader.read());
		trigger.emit("TEST3");
		trigger.emit("TEST4");
		Assert.same(["TEST3", "TEST4"], reader.read());
	}

	public function testReadDoesntEmit() {
		trigger.connectTo(reader);
		reader.connectTo(reader2);
		trigger.emit("TEST");
		Assert.same(["TEST"], reader.read());
		Assert.same([], reader2.read());
	}
}
