package flow;

import flow.Component.Component1to1;
import flow.FlowUtil;
import flow.Flow;
import utest.*;

class FlowUtilTest extends utest.Test {

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

	// public function testJoin() {
	// 	var join = FlowUtil.join4();
	// 	var end = Flow.getEnd();
	// 	end.accumulate(true);
	// 	// todo wesd
	// }
}
