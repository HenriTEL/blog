# Python Protocol

A protocol allows us to define interfaces that can be type checked.
It's an alternative to abstract classes that don't rely on duck typing instead of inheritance.  
As long as a class implements the protocol's methods it will pass the type checking.  
There are many predefined protocols in the standard library but they are currently defined as abstract classes under `collections.abc`.
Examples include `Iterable`, `Hashable`, `Callable`, `Sequence`.

## Advantages

Decoupling. We don't need to import anything to implement a protocol, while with inheritance we need to import the parent class.  
It also mean that there's no risk of partial code execution in parent classes wit something like `super().mymethod()`

## Limitations

Protocols can't be checked at runtime, e.g. with `isinstance()` unless you use the `@runtime_checkable` decorator.
