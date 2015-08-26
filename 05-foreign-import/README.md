Foreign import
==============

JavaScript functions can be imported and used from PureScript via the Foreign
Function Interface. You accomplish this by writing special "foreign modules".
A foreign module is a CommonJS module that:

1. Includes a `// module ModuleName` line where `ModuleName` is the name of the
   module.
2. Specifies all its exports in the form `exports.name = value;`.

A foreign module member is imported into PureScript and given a type using the
special `foreign import` statement. This is unsafe in the sense that you are
responsible for the function adhering to the type signature you give.

    foreign import name :: TheTypeSignature

Also, remember from before that we need to tell the compiler where to find
these foreign files with the `--ffi` argument.

PureScript handles effects slightly differently from Haskell and its IO monad,
so we'll talk about that in a separate section and look at how we import
effectful functions then.

### Example: Import a curried function

We can define a curried JavaScript function in `src/purs/Function.js`:

```javascript
exports.multiplyCurried = function(a) {
  return function(b) {
    return a * b;
  };
};
```

`src/purs/Function.purs`:

```purescript
foreign import multiplyCurried :: Number -> Number -> Number
```

And we can use this from PureScript:

    > Import.Function.multiplyCurried 2.0 3.0
    6.0

### Example: Import an uncurried function

We can also import an uncurried JavaScript function and do the work to uncurry
it in PureScript:

`src/purs/Function.js`:

```javascript
exports.multiplyUncurried = function(a, b) {
  return a * b;
};
```

`src/purs/Function.purs`:

```purescript
foreign import multiplyUncurried :: Fn2 Number Number Number
```

To use this from PureScript requires that we "uncurry" the `Fn2` type with the
`Data.Function.runFn2` function:

    > Data.Function.runFn2 Import.Function.multiplyUncurried 2.0 3.0
    6.0

### Example: Import primitive values

Let's consider the foreign module `src/purs/Simple.js`:

```javascript
// module Import.Simple

exports.string = "MASH";
exports.integer = 3;
exports.boolean = true;
exports.array = [1,2,3];
exports.object = { foo: 1, bar: "quux" };
```

And import the exports into our `src/purs/Simple.purs` module:

```purescript
module Import.Simple where

foreign import string :: String
foreign import integer :: Int
foreign import boolean :: Boolean
foreign import array :: Array Int
foreign import object :: Object ( foo :: Int, bar :: String )
```

If we load `psci` with these modules and foreigns (like you would invoke `psc`,
but with `psci` instead and no `--output` argument) we can try to access these
from PureScript:

    > :t Import.Simple.array
    Prim.Array Prim.Int
    > Import.Simple.array
    [1,2,3]

### Example: Import a value whose type is unknown at compile time

In some cases we need to handle data whose type is only known at runtime. To do
this, PureScript provides the
[`purescript-foreign`](http://pursuit.purescript.org/packages/purescript-foreign/)
package. This defines a `data Foreign :: *` type which can represent any
foreign value and an `IsForeign` typeclases:

```purescript
type F = Either ForeignError

class IsForeign a where
  read :: Foreign -> F a
```

We can then create instances for any type that we can safely coerce a `Foreign`
value to. `purescript-foreign` provides several functions that allow us to
inspect and safely coerce foreign values to specific types (see the Pursuit
documentation). For example, we can define an function that returns an object
or undefined:

```javascript
exports.getValue = function(bool) {
  if (bool) {
    return {
      foo: 1,
      bar: "quux"
    };
  } else {
    return undefined;
  }
};
```

And then import this together with a safe Foreign coerce (parse) function:

```purescript
import Prelude
import Data.Foreign
import Data.Foreign.Class

data FooBar = FooBar Int String

instance showFooBar :: Show FooBar where
  show (FooBar i s) = "FooBar " ++ (show i) ++ " " ++ s

instance isForeignFooBar :: IsForeign FooBar where
  read value = do
    foo <- readProp "foo" value
    bar <- readProp "bar" value
    return $ FooBar foo bar

foreign import getValue :: Boolean -> Foreign
```

Which we can then use as follows:

    > import Import.Data
    > import Data.Foreign
    > import Data.Foreign.Class

    > :t getValue true
    Data.Foreign.Foreign

    > read (getValue false) :: F FooBar
    Left (Type mismatch: expected object, found undefined)

    > read (getValue true) :: F FooBar
    Right (FooBar 1 quux)
