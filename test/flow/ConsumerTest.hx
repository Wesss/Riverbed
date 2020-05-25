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

	public function test1in() {
		var signals:Array<String> = [];
		var consumer = Flow.getConsumer1(
			(signal:String) -> {
				signals.push(signal);
			}
		);
		start.to(consumer.in1);

		// this should compile error
		// trace(consumer.in2);

		start.emit("TEST");
		Assert.same(["TEST"], signals);
	}

	public function test2in() {
		var signals:Array<Any> = [];
		var consumer = Flow.getConsumer2(
			(signal:String) -> {
				signals.push(signal);
			},
			(signal:Int) -> {
				signals.push(signal);
			}
		);
		start.to(consumer.in1);
		start2.to(consumer.in2);

		start2.emit(2);
		start.emit("TEST");
		start2.emit(3);
		Assert.same([2, "TEST", 3], signals);
	}

	// public function testFourins() {
	// 	var signals:Array<Any> = [];
	// 	var consumer = Flow.getConsumer4(
	// 		(signal:String) -> {
	// 			signals.push(signal);
	// 		},
	// 		(signal:Int) -> {
	// 			signals.push(signal);
	// 		},
	// 		(signal:UnitSignal) -> {
	// 			signals.push(signal);
	// 		},
	// 		(signal:Array<String>) -> {
	// 			signals.push(signal);
	// 		}
	// 	);
	// 	start.to(consumer.in1);
	// 	start2.to(consumer.in2);
	// 	start3.to(consumer.in3);
	// 	start4.to(consumer.in4);

	// 	start3.emit(null);
	// 	start2.emit(2);
	// 	start4.emit(["TEST2"]);
	// 	start.emit("TEST");
	// 	Assert.same([null, 2, ["TEST2"], "TEST"], signals);
	// }
}