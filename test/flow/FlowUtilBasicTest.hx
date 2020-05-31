package flow;

import flow.Component.Component1to1;
import flow.FlowUtil;
import flow.Flow;
import utest.*;

class FlowUtilBasicTest extends utest.Test {

	public function testCaster() {
		var startStr = Flow.getStart();
		var end = Flow.getEnd();
		end.accumulate(true);
		var caster:Component1to1<String, Any> = FlowUtil.getCast();
		startStr.to(caster.in1);
		caster.out1.to(end);

		startStr.emit("TEST");
		Assert.same(["TEST"], end.getSignals());
	}

	public function testTransform() {
		var start = Flow.getStart();
		var end = Flow.getEnd();
		end.accumulate(true);
		var transformer = FlowUtil.transform((signal:String) -> {return signal.length;});
		
		start.to(transformer.in1);
		transformer.out1.to(end);

		start.emit("TEST");
		Assert.same([4], end.getSignals());
	}

	public function testJoin() {
		var start1 = Flow.getStart();
		var start2 = Flow.getStart();
		var join = FlowUtil.join2();
		var end = Flow.getEnd();
		end.accumulate(true);

		start1.to(join.in1);
		start2.to(join.in2);
		join.out1.to(end);

		start1.emit("hello");
		Assert.same([], end.getSignals());
		start2.emit(3);
		Assert.same([{in1:"hello", in2:3, in3:null, in4:null}], end.getSignals(), true);

		start2.emit(4);
		Assert.same([], end.getSignals());
		start1.emit("hello2");
		Assert.same([{in1:"hello2", in2:4, in3:null, in4:null}], end.getSignals(), true);
	}

	public function testJoinResets() {
		var start1 = Flow.getStart();
		var start2 = Flow.getStart();
		var join = FlowUtil.join2();
		var end = Flow.getEnd();
		end.accumulate(true);

		start1.to(join.in1);
		start2.to(join.in2);
		join.out1.to(end);

		start1.emit("hello");
		Assert.same([], end.getSignals());
		start2.emit(3);
		Assert.same([{in1:"hello", in2:3, in3:null, in4:null}], end.getSignals(), true);

		start1.emit("hello2");
		Assert.same([], end.getSignals());
		start2.emit(4);
		Assert.same([{in1:"hello2", in2:4, in3:null, in4:null}], end.getSignals(), true);
	}

	public function testJoin4() {
		var start1 = Flow.getStart();
		var start2 = Flow.getStart();
		var start3 = Flow.getStart();
		var start4 = Flow.getStart();
		var join = FlowUtil.join4();
		var end = Flow.getEnd();
		end.accumulate(true);

		start1.to(join.in1);
		start2.to(join.in2);
		start3.to(join.in3);
		start4.to(join.in4);
		join.out1.to(end);

		start1.emit("hello");
		Assert.same([], end.getSignals());
		start2.emit(3);
		Assert.same([], end.getSignals());
		start3.emit(UnitSignal.inst);
		Assert.same([], end.getSignals());
		start4.emit(["test", "array"]);
		Assert.same(
			[{in1:"hello", in2:3, in3:UnitSignal.inst, in4:["test", "array"]}],
			end.getSignals(),
			true
		);
	}
}
