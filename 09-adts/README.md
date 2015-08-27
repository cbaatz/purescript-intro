Algebraic Data Types
====================

Algrebraic data types are an integral part of typed functional languages. The
only reason we've left them until this late is that in addition to records,
there isn't much to say about this in addition to how they are used in Haskell.

PureScript supports `type` aliases, `newtypes`, and algebraic `data` types:

```purescript
type Length = Number
newtype Length = Length Number
data Length = Length Number LengthUnit
```

And pattern matching:

```purescript
show (Length n u) = (show n) ++ " " ++ (show u)
foo l@(Length _ u) | u == Unitless = "-"
                   | otherwise     = show l

bar :: Array Int -> Int
bar [a, b, _] = a + b
bar _ = 0
```

Note that PureScript does not support cons patterns like `(x:xs)` however.

JavaScript representation
-------------------------

We'll only look at ADTs briefly to gain some insight into their JavaScript
runtime representation. Consider a dummy type:

```purescript
data Foo a b = Zero | One a | Two a b
```

And its JavaScript representation:

```javascript
var Zero = (function () {
    function Zero() {

    };
    Zero.value = new Zero();
    return Zero;
})();
var One = (function () {
    function One(value0) {
        this.value0 = value0;
    };
    One.create = function (value0) {
        return new One(value0);
    };
    return One;
})();
var Two = (function () {
    function Two(value0, value1) {
        this.value0 = value0;
        this.value1 = value1;
    };
    Two.create = function (value0) {
        return function (value1) {
            return new Two(value0, value1);
        };
    };
    return Two;
})();
```

We can see that each data constructor is compiled into a class constructor.
Data constructors without parameters get an instantiated value at `.value`
(`Zero.value` for example). Data constructors with variables require these to
be passed to the constructor:

```javascript
var foo = Zero.value;
var baz = new Two("Hello", "Goodbye");
var bar = new One("Hello");
```

Deriving
--------

The support for automatically deriving typeclass instances for data types isn't
particularly good yet, though some support for generic deriving was added in
0.7.3 (mid-August 2015).
