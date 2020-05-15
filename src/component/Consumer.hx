package component;

/**
    A Consumer is a black box process that can receive signals emitted by other components and triggers
    and emit new signals.
**/
interface Consumer<T> extends Receiver<T>
{
}