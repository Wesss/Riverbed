package util;

import util.*;
import utest.*;

class ManualTest extends utest.Test {

	var trigger:ManualTrigger;
	var reader:ManualReader;

	public function setup() {
		var trigger = new ManualTrigger();
		var reader = new ManualReader();
		trigger.connectTo(reader);
	}

	public function testOneTrigger() {
		trigger.emit("TEST");
		Assert.equals("TEST", reader.read());
	}
}
