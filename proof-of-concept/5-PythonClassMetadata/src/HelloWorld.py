import MethodRunner
from MethodRunner import _hx_AnonObject
from MethodRunner import lib_domain_VoidDomain

class HelloWorld:
    __slots__ = ()

    def __init__(self):
        pass

    def getFunctions(self):
        return [_hx_AnonObject({'parameter': lib_domain_VoidDomain, 'method': self.arbitraryMethod})]

    def arbitraryMethod(self,_):
        print("Hello World from an arbitrary python method")
        return _
