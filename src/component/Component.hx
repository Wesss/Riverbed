package component;

/**
    A component is a black box process that can receive signals emitted by other components and triggers
    and emit new signals.
**/
interface Component<T> extends Receiver<T> extends Emitter
{
}