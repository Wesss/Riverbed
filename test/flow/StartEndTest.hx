package flow;

import flow.Flow;
import utest.*;

class StartEndTest extends utest.Test {

	var start:Start<String>;
	var start2:Start<String>;
	var start3:Start<String>;
	var end:End<String>;
	var end2:End<String>;
	var end3:End<String>;

	public function setup() {
		start = Flow.getStart();
		start2 = Flow.getStart();
		start3 = Flow.getStart();
		end = Flow.getEnd();
		end.accumulate(true);
		end2 = Flow.getEnd();
		end2.accumulate(true);
		end3 = Flow.getEnd();
		end3.accumulate(true);
	}

	public function testOneSignal() {
		start.to(end);
		start.emit("TEST");

		Assert.same(["TEST"], end.getSignals());
	}

	public function testManySignals() {
		start.to(end);
		start.emit("TEST");
		start.emit("TEST2");
		start.emit("TEST3");
		Assert.same(["TEST", "TEST2", "TEST3"], end.getSignals());
	}

	public function testManyToOne() {
		start.to(end);
		start2.to(end);
		start3.to(end);
		start2.emit("TEST");
		start3.emit("TEST2");
		start.emit("TEST3");
		Assert.same(["TEST", "TEST2", "TEST3"], end.getSignals());
	}

	public function testOneToMany() {
		start.to(end);
		start.to(end2);
		start.to(end3);
		start.emit("TEST");
		Assert.same(["TEST"], end.getSignals());
		Assert.same(["TEST"], end2.getSignals());
		Assert.same(["TEST"], end3.getSignals());
	}

	public function testReadGivesLatestSignals() {
		start.to(end);
		start.emit("TEST");
		start.emit("TEST2");
		Assert.same(["TEST", "TEST2"], end.getSignals());
		start.emit("TEST3");
		start.emit("TEST4");
		Assert.same(["TEST3", "TEST4"], end.getSignals());
	}

	public function testReadFrom() {
		end.readFrom(start);
		start.emit("TEST");
		Assert.same(["TEST"], end.getSignals());
	}
}
