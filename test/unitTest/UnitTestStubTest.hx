package unitTest;

import massive.munit.Assert;
import unitTest.UnitTestStub;

class UnitTestStubTest {
	var unitTestStub:UnitTestStub;

	public function new() {
	}

	@Before
	public function setup() {
		this.unitTestStub = new UnitTestStub();
	}

	@Test
	public function testAssertTrue() {
		Assert.isTrue(true);
	}

	@Test
	public function testSrcCode() {
		Assert.isTrue(this.unitTestStub.getTrue());
	}
}
