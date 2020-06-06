package flow;

import flow.Flow.UnitSignal;
import flow.Component;

class FlowUtil
{
    /**
        Emits signals as they're received.
    **/
    public static function unitComponent<T>():Component1to1<T, T>
    {
        return Flow.getComponent1to1(
            (signal:T, out:(T)->Void) -> {
                out(signal);
            }
        );
    }

    /**
        Given any signal, emits a constant signal.
    **/
    public static function toConst<T, V>(const:V):Component1to1<T, V>
    {
        return Flow.getComponent1to1(
            (signal:T, out:(V)->Void) -> {
                out(const);
            }
        );
    }

    /**
        Emits signals as they're received, but casting them to type V.
    **/
    public static function getCast<T,V>():Component1to1<T, V>
    {
        return Flow.getComponent1to1(
            (signal:T, out:(V)->Void) -> {
                out(cast signal);
            }
        );
    }

    /**
        Given a function of T -> V, returns a component that call the given
        function for each signal and emits the result.
    **/
    public static function transform<T,V>(fn:T->V):Component1to1<T, V>
    {
        return Flow.getComponent1to1(
            (signal:T, out:(V)->Void) -> {
                out(fn(signal));
            }
        );
    }

    /**
        Given a function of T -> Bool, returns a component that emits given
        signals on out1 if fn(in1) is true, and emits on out2 otherwise
    **/
    public static function filter<T>(fn:T->Bool):Component1to2<T, T, T>
    {
        return Flow.getComponent1to2(
            (signal:T, outTrue:(T)->Void, outFalse:(T)->Void) -> {
                if (fn(signal)) {
                    outTrue(signal);
                } else {
                    outFalse(signal);
                }
            }
        );
    }

    /**
        Traces signals received.
    **/
    public static function tracer<T>(tag = "", fn:T->String = null):Consumer1<T>
    {
        var prefix = tag == "" ? "" : tag + ": ";
        if (fn == null) {
            return Flow.getConsumer1(
                (signal:T) -> {
                    trace(prefix + Std.string(signal));
                }
            );
        } else {
            return Flow.getConsumer1(
                (signal:T) -> {
                    trace(prefix + fn(signal));
                }
            );
        }
    }

    /**
        Emits True when receiving a signal from in1, false if from in2.
    **/
    public static function toBool<T,V>():Component2to1<T, V, Bool>
    {
        return Flow.getComponent2to1(
            (signal:T, out:(Bool)->Void) -> {
                out(true);
            },
            (signal:V, out:(Bool)->Void) -> {
                out(false);
            }
        );
    }

    /**
        emits on out1 if given signal is true, emits on out2 when false.
    **/
    public static function splitBool():Component1to2<Bool, UnitSignal, UnitSignal>
    {
        return Flow.getComponent1to2(
            (signal:Bool, outTrue:(UnitSignal)->Void, outFalse:(UnitSignal)->Void) -> {
                signal ? outTrue(UnitSignal.inst) : outFalse(UnitSignal.inst);
            }
        );
    }

    /**
        Outputs a composite signal once every input is called once.
        Throws an exception if an input is called more than once before all are called once.
        todo wesd async whatever order support? possible by refactoring out state to be passed in
        into functions, option to have a state per signal "stack".
    **/
    public static function join2<I1, I2, I3, I4>()
    :Component2to1<I1, I2, {in1:I1, in2:I2}> {
        return cast join(2);
    }

    /**
        Outputs a composite signal once every input is called once.
        Throws an exception if an input is called more than once before all are called once.
        todo wesd async whatever order support? possible by refactoring out state to be passed in
        into functions, option to have a state per signal "stack".
    **/
    public static function join3<I1, I2, I3>()
    :Component3to1<I1, I2, I3, {in1:I1, in2:I2, in3:I3}> {
        return cast join(3);
    }

    /**
        Outputs a composite signal once every input is called once.
        Throws an exception if an input is called more than once before all are called once.
    **/
    public static function join4<I1, I2, I3, I4>()
    :Component4to1<I1, I2, I3, I4, {in1:I1, in2:I2, in3:I3, in4:I4}> {
        return join(4);
    }

    private static function join<I1, I2, I3, I4>(inCount:Int) {
        var arg1, arg2, arg3, arg4;
        var seen1 = false, seen2 = false, seen3 = false, seen4 = false;
        function reset() {
            arg1 = null;
            arg2 = null;
            arg3 = null;
            arg4 = null;
            seen1 = false;
            seen2 = false;
            seen3 = false;
            seen4 = false;
        }
        function emitIfSeen(emit) {
            if (inCount == 4 && seen1 && seen2 && seen3 && seen4) {
                var res = {in1:arg1, in2:arg2, in3:arg3, in4:arg4};
                reset();
                emit(res);
            }
            if (inCount == 3 && seen1 && seen2 && seen3) {
                var res = {in1:arg1, in2:arg2, in3:arg3, in4:null};
                reset();
                emit(res);
            }
            if (inCount == 2 && seen1 && seen2) {
                var res = {in1:arg1, in2:arg2, in3:null, in4:null};
                reset();
                emit(res);
            }
        }
        return Flow.getComponent4to1(
            (sig1, emit) -> {
                seen1 = true;
                arg1 = sig1;
                emitIfSeen(emit);
            },
            (sig2, emit) -> {
                seen2 = true;
                arg2 = sig2;
                emitIfSeen(emit);
            },
            (sig3, emit) -> {
                seen3 = true;
                arg3 = sig3;
                emitIfSeen(emit);
            },
            (sig4, emit) -> {
                seen4 = true;
                arg4 = sig4;
                emitIfSeen(emit);
            }
        );
    }
    
    /**
        Given element signals (in1) followed by end iterable (in2),
        emits one at a time (out1) upon given a next signal (in3).
        The first signal is emit immediately.
        Once all given elements are emitted, end iterable is emitted (out2).
    **/
    public static function singleFile<T>()
    :Component3to2<T, UnitSignal, UnitSignal, T, UnitSignal> {
        var isWaiting = false;
        var sawEnd = false;
        var queue:Array<T> = [];
        function enQueue(signal:T, go:T->Void, end:UnitSignal->Void) {
            queue.push(signal);
            if (!isWaiting && queue.length > 0) {
                var nextSig = queue.shift();
                isWaiting = true;
                go(nextSig);
            }
        }
        function markEnd(end:UnitSignal, go:T->Void, end:UnitSignal->Void) {
            sawEnd = true;
            if (!isWaiting && queue.length == 0) {
                sawEnd = false;
                end(UnitSignal.inst);
            }
        }
        function next(next:UnitSignal, go:T->Void, end:UnitSignal->Void) {
            isWaiting = false;
            if (sawEnd && queue.length == 0) {
                sawEnd = false;
                end(UnitSignal.inst);
            }
            if (!isWaiting && queue.length > 0) {
                var nextSig = queue.shift();
                isWaiting = true;
                go(nextSig);
            }
        }

        return Flow.getComponent3to2(enQueue, markEnd, next);
    }
}
