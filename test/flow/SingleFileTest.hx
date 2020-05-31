package flow;

import flow.Component.Component3to2;
import flow.Component.Component1to1;
import flow.FlowUtil;
import flow.Flow;
import utest.*;

class SingleFileTest extends utest.Test {

	var inSig:Start<String>;
	var inEnd:Start<UnitSignal>;
	var inNext:Start<UnitSignal>;
	var outSig:End<String>;
	var outEnd:End<UnitSignal>;
	var singleFile:Component3to2<String, UnitSignal, UnitSignal, String, UnitSignal>;

	var unit = UnitSignal.inst;

	public function setup() {
		inSig = Flow.getStart();
		inEnd = Flow.getStart();
		inNext = Flow.getStart();
		outSig = Flow.getEnd();
		outSig.accumulate(true);
		outEnd = Flow.getEnd();
		outEnd.accumulate(true);

		singleFile = FlowUtil.singleFile();
		inSig.to(singleFile.in1);
		inEnd.to(singleFile.in2);
		inNext.to(singleFile.in3);
		singleFile.out1.to(outSig);
		singleFile.out2.to(outEnd);
	}

	public function testEndsOnNothing() {
		inEnd.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([unit], outEnd.getSignals());
	}

	public function testSingle() {
		inSig.emit("test1");
		Assert.same(["test1"], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inNext.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inEnd.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([unit], outEnd.getSignals());
	}

	public function testQueueEnd() {
		inSig.emit("test1");
		Assert.same(["test1"], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inEnd.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inNext.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([unit], outEnd.getSignals());
	}

	public function testMany() {
		inSig.emit("test1");
		Assert.same(["test1"], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inNext.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([], outEnd.getSignals());

		inSig.emit("test2");
		Assert.same(["test2"], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inNext.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([], outEnd.getSignals());

		inSig.emit("test3");
		Assert.same(["test3"], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inNext.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([], outEnd.getSignals());

		inEnd.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([unit], outEnd.getSignals());
	}

	public function testQueue() {
		inSig.emit("test1");
		Assert.same(["test1"], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inSig.emit("test2");
		Assert.same([], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inSig.emit("test3");
		Assert.same([], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inEnd.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([], outEnd.getSignals());

		inNext.emit(unit);
		Assert.same(["test2"], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inNext.emit(unit);
		Assert.same(["test3"], outSig.getSignals());
		Assert.same([], outEnd.getSignals());
		inNext.emit(unit);
		Assert.same([], outSig.getSignals());
		Assert.same([unit], outEnd.getSignals());
	}
}
