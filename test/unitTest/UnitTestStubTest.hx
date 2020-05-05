package unitTest;

import unitTest.UnitTestStub;
import utest.*;

class UnitTestStubTest extends utest.Test {
	var unitTestStub:UnitTestStub;

	public function setup() {
		this.unitTestStub = new UnitTestStub();
	}

	public function testAssertTrue() {
		Assert.isTrue(true);
	}

	public function testSrcCode() {
		Assert.isTrue(this.unitTestStub.getTrue());
	}
}
