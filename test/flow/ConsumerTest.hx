package flow;

import flow.Flow;
import utest.*;

class ConsumerTest extends utest.Test {

	var start:Start<String>;
	var start2:Start<Int>;
	var start3:Start<UnitSignal>;
	var start4:Start<Array<String>>;

	public function setup() {
		start = Flow.getStart();
		start2 = Flow.getStart();
		start3 = Flow.getStart();
		start4 = Flow.getStart();
	}

	public function testOneInput() {
		var signals:Array<String> = [];
		var consumer = Flow.getConsumer1(
			(signal:String) -> {
				signals.push(signal);
			}
		);
		start.to(consumer.input1);

		// this should compile error
		// trace(consumer.input2);

		start.emit("TEST");
		Assert.same(["TEST"], signals);
	}

	public function testTwoInputs() {
		var signals:Array<Any> = [];
		var consumer = Flow.getConsumer2(
			(signal:String) -> {
				signals.push(signal);
			},
			(signal:Int) -> {
				signals.push(signal);
			}
		);
		start.to(consumer.input1);
		start2.to(consumer.input2);

		start2.emit(2);
		start.emit("TEST");
		start2.emit(3);
		Assert.same([2, "TEST", 3], signals);
	}

	public function testFourInputs() {
		var signals:Array<Any> = [];
		var consumer = Flow.getConsumer4(
			(signal:String) -> {
				signals.push(signal);
			},
			(signal:Int) -> {
				signals.push(signal);
			},
			(signal:UnitSignal) -> {
				signals.push(signal);
			},
			(signal:Array<String>) -> {
				signals.push(signal);
			}
		);
		start.to(consumer.input1);
		start2.to(consumer.input2);
		start3.to(consumer.input3);
		start4.to(consumer.input4);

		start3.emit(null);
		start2.emit(2);
		start4.emit(["TEST2"]);
		start.emit("TEST");
		Assert.same([null, 2, ["TEST2"], "TEST"], signals);
	}
}