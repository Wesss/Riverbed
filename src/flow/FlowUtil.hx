package flow;

import flow.Component;

class FlowUtil
{
    /**
        Emits signals as they're received.
    **/
    public static function getUnitComponent<T>():Component1to1<T, T>
    {
        return Flow.getComponent1to1(
            (signal:T, out1:(T)->Void) -> {
                out1(signal);
            }
        );
    }

    public static function getCast<T,V>():Component1to1<T, V>
    {
        return Flow.getComponent1to1(
            (signal:T, out1:(V)->Void) -> {
                out1(cast signal);
            }
        );
    }

    /**
        Outputs a composite signal once every input is called once.
        Throws an exception if an input is called more than once before all are called once.
        todo wesd async whatever order support?
    **/
    public static function join4<I1, I2, I3, I4>()
        :Component4to1<I1, I2, I3, I4, {in1:I1, in2:I2, in3:I3, in4:I4}>
    {
        var arg1, arg2, arg3, arg4;
        // return Flow.getComponent4to1(
        //     // todo wesd
        // );
        return null;
    }
}
