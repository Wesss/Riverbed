package unitTest;

import unitTest.UnitTestStub;

class UnitTestStubTest extends haxe.unit.TestCase {
	var unitTestStub:UnitTestStub;

	override public function setup() {
		this.unitTestStub = new UnitTestStub();
	}

	public function testAssertTrue() {
		assertTrue(true);
	}

	public function testSrcCode() {
		assertTrue(this.unitTestStub.getTrue());
	}
}
