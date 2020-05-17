
class Repro
{
    static function main()
    {
        var test = new ConstraintTest<TestParent>();
        // var test = new ConstraintTest();
        test.caller();
    }
}

// @:generic breaks
@:generic
class MyGeneric<T>
{
    public function new (fn:T)
    {
        trace(fn);
    }
}

class GenericTester
{
    public static function getTracer():MyGeneric<Int>
    {
        var arg:Int = 3;
        // This throws a compiler error
        // return getGeneric(Int);
        return null;
    }

    @:generic
    public static function getGeneric<T>(T):MyGeneric<T>
    {
        return new MyGeneric(T);
    }
}

// type constraints
class TestParent { public function new() {} }
class TestChild extends TestParent { public function new() { super(); } }

@:generic
interface ConstraintInter<T>
{
    // this causes a compiler error
	// public function fn<V:T>(arg:Array<V>):Void;
}

@:generic
class ConstraintTest<T> implements ConstraintInter<T>
{
    public function new () {}

	public function fn<V:T>(arg:Array<V>):Void
	{
        var first:T = cast arg[0];
		trace(first);
	}

	public function caller()
	{
        var test = new ConstraintTest<TestParent>();
        // var test = new ConstraintTest();
        // Base case that always works
        test.fn([new TestParent()]);

        // I want this to work.
        var childArray:Array<TestChild> = [new TestChild()];
        test.fn(childArray);

        // This should throw a compile error.
		// test.fn([3]);
	}
}
