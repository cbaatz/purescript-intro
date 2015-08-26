Foreign export 
==============

In this section we'll look at how to export basic functions and data from
PureScript for use from JavaScript. In later sections we will look at how
features like type-classes and algebraic data types are represented in
JavaScript, but here we'll focus on exposing more conventional JavaScript APIs.

Functions
---------

Reminder: a *curried* function of two arguments has type `a -> b -> c`; an
*uncurried* function of two arguments has type `(a, b) -> c`. (These are
Haskell types, PureScript defines tuples as normal type and data constructors,
`Tuple`, without special syntax.)

### Example: Export a curried JavaScript function

The curried PureScript function:

```purescript
multiply :: Number -> Number -> Number
multiply x y = x * y
```

Translates into a JavaScript function as:

```javascript
var multiply = function (x) {
    return function (y) {
        return x * y;
    };
};
```

You can `make` from the repository root and look at the compiled files in the
`purescript_modules` directory. You can also do `make node` from there to start
node with the `purescript_modules` directory added to the `NODE_PATH`.

    make node
    > require("Export.Curried").multiply(3)(5)
    15

That is, PureScript retains the curried form (`a -> b -> c`) in JavaScript;
"two arguments" generats a function of a single argument that returns another
function of a single argument.

### Example: Export an uncurried JavaScript function

If we export our modules to be used from JavaScript, we often want the
uncurried form since that is more conventional JavaScript. We achieve that with
the `mkFnX` functions from the `purescript-functions` library:

```purescript
import Data.Function (mkFn2, Fn2(..))

multiply :: Fn2 Number Number Number
multiply = mkFn2 multiply'

multiply' :: Number -> Number -> Number
multiply' x y = x * y
```
    
Can be used from JavaScript as:

    make node
    > require("Export.Uncurried").multiply(3,5)
    15

Again, we can inspect the output in `purescript_modules` to see how PureScript
compiles to JavaScript and how the `mkFn2` function is implemented.

Note that the *uncurried JavaScript function* (of two arguments in this case)
is not generated from the *uncurried PureScript* function `Tuple a b -> c`, but
from the special type `Fn2 a b c`. The `purescript-functions` library provides
support for up to 10 arguments.

Name translation
----------------

PureScript tries to preserve names as much as it can, but JavaScript has
different restrictions on names so some translation is needed. In particular,
reserved names are prefixed with `$$` and symbols are replaced with their
`$`-prefixed names.  For example:

    null   -> $$null
    alice' -> alice$prime

Data
----

PureScript has a built-in `Prim` module with types that correspond closely to
JavaScript's primitive types: Boolean, String, Number, Array, and Object.

PureScript distinguishes between integer and non-integer numbers and has an Int
type for this. Literals without a decimal point will match Int but not Number
and vice versa.

The Object type is special and defines an "extensible record" in PureScript.
We'll look at that in more detail in later sections.

It's easy to explore these types in `psci` using the `:t` command:

    psci
    > :t [2,3,4]
    Prim.Array Prim.Int

### Example: Export primitive JavaScript values

```purescript
boolean :: Boolean
boolean = true

string :: String
string = "Hello, PureScript!"

number :: Number
number = 3.14159

int :: Int
int = 42

array :: Array Int
array = [1,2,3]

record :: Object ( foo :: Int, bar :: String )
record = { foo: 1, bar: "quux" }

recordAltSyntax :: { foo :: Int, bar :: String }
recordAltSyntax = { foo: 1, bar: "quux" }

arrayTriple :: forall a. a -> Array a
arrayTriple x = [x, x, x]
```

These translate directly to JavaScript as you would expect (you can check the
output in `purescript_modules`). Note however that the PureScript `Array` type
is less expressive than JavaScript arrays since PureScript requires all
elements of an Array to have the same type.
