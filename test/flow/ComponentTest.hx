package flow;

import flow.Flow;
import utest.*;

class ComponentTest extends utest.Test {

	var start:Start<String>;
	var start2:Start<UnitSignal>;
	var start3:Start<Int>;
	var start4:Start<Array<String>>;
	var end:End<String>;
	var end2:End<UnitSignal>;
	var end3:End<Int>;
	var end4:End<Array<String>>;

	public function setup() {
		start = Flow.getStart();
		start2 = Flow.getStart();
		start3 = Flow.getStart();
		start4 = Flow.getStart();
		end = Flow.getEnd();
		end.accumulate(true);
		end2 = Flow.getEnd();
		end2.accumulate(true);
		end3 = Flow.getEnd();
		end3.accumulate(true);
		end4 = Flow.getEnd();
		end4.accumulate(true);
	}

	public function test1to1() {
		var toLower = Flow.getComponent1to1(
			(arg:String, emit1:(String -> Void)) -> {
				emit1(arg.toLowerCase());
			}
		);
		start.to(toLower.in1);
		toLower.out1.to(end);

		start.emit("TEST");
		Assert.same(["test"], end.getSignals());
	}

	public function test2to1() {
		var test = Flow.getComponent2to1(
			(arg:String, emit1:(String -> Void)) -> {
				emit1(arg);
			},
			(end:UnitSignal, emit1:(String -> Void)) -> {
				emit1("Unit");
			}
		);
		start.to(test.in1);
		start2.to(test.in2);
		test.out1.to(end);

		start.emit("TEST");
		start.emit("TEST2");
		start.emit("TEST3");
		start2.emit(UnitSignal.inst);
		Assert.same(["TEST", "TEST2", "TEST3", "Unit"], end.getSignals());
	}

	public function test1to2() {
		var test = Flow.getComponent1to2(
			(arg:String, emit1:(String -> Void), emit2:(UnitSignal -> Void)) -> {
				if (arg.indexOf("TEST") > -1) {
					emit1(arg);
				} else {
					emit2(UnitSignal.inst);
				}
			}
		);
		start.to(test.in1);
		test.out1.to(end);
		test.out2.to(end2);

		start.emit("TEST");
		start.emit("hello");
		start.emit("TEST3");
		Assert.same(["TEST", "TEST3"], end.getSignals());
		Assert.same([UnitSignal.inst], end2.getSignals());
	}

	public function test2to2() {
		var test = Flow.getComponent2to2(
			(arg:String, emit1:(String -> Void), emit2:(UnitSignal -> Void)) -> {
				if (arg.indexOf("TEST") > -1) {
					emit1(arg);
				} else {
					emit2(UnitSignal.inst);
				}
			},
			(arg:UnitSignal, emit1:(String -> Void), emit2:(UnitSignal -> Void)) -> {
				emit1("Unit");
				emit2(arg);
			}
		);
		start.to(test.in1);
		start2.to(test.in2);
		test.out1.to(end);
		test.out2.to(end2);

		start.emit("TEST");
		start.emit("hello");
		start2.emit(UnitSignal.inst);
		Assert.same(["TEST", "Unit"], end.getSignals());
		Assert.same([UnitSignal.inst, UnitSignal.inst], end2.getSignals());
	}

	public function test4to4() {
		var test = Flow.getComponent4to4(
			(
				arg:String,
				emit1:(String -> Void), emit2:(UnitSignal -> Void),
				emit3:(Int -> Void), emit4:(Array<String> -> Void)
			) -> {
				emit1(arg);
				emit2(UnitSignal.inst);
			},
			(
				arg:UnitSignal,
				emit1:(String -> Void), emit2:(UnitSignal -> Void),
				emit3:(Int -> Void), emit4:(Array<String> -> Void)
			) -> {
				emit2(arg);
				emit3(0);
			},
			(
				arg:Int,
				emit1:(String -> Void), emit2:(UnitSignal -> Void),
				emit3:(Int -> Void), emit4:(Array<String> -> Void)
			) -> {
				emit3(arg);
				emit4([Std.string(arg)]);
			},
			(
				arg:Array<String>,
				emit1:(String -> Void), emit2:(UnitSignal -> Void),
				emit3:(Int -> Void), emit4:(Array<String> -> Void)
			) -> {
				emit4(arg);
				emit1(arg[0]);
			}
		);
		start.to(test.in1);
		start2.to(test.in2);
		start3.to(test.in3);
		start4.to(test.in4);
		test.out1.to(end);
		test.out2.to(end2);
		test.out3.to(end3);
		test.out4.to(end4);

		start.emit("TEST");
		start2.emit(UnitSignal.inst);
		start3.emit(3);
		start4.emit(["Test2", "Test3"]);
		Assert.same(["TEST", "Test2"], end.getSignals());
		Assert.same([UnitSignal.inst, UnitSignal.inst], end2.getSignals());
		Assert.same([0, 3], end3.getSignals());
		Assert.same([["3"], ["Test2", "Test3"]], end4.getSignals());
	}
}