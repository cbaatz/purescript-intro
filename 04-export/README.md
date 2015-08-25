Exporting functions
===================

How do PureScript functions translate to JavaScript functions?

    multiply :: Int -> Int -> Int
    multiply x y = x * y

    var multiply = function (x) {
        return function (y) {
            return x * y | 0;
        };
    };

    psc Functions.purs ../app/bower_components/**/*.purs --ffi ../app/bower_components/**/*.js

    NODE_PATH=output:$NODE_PATH node

    > require("output/Simple").multiply(3)(5)
    15

That is, PureScript retains the curried form (`a -> b -> c`) in JavaScript;
"two arguments" generats a function of a single argument that returns another
function of a single argument.

However, if we export our modules to be used from JavaScript, we often want the
uncurried (`(a,b) -> c`) JavaScript functions. We achieve that with the `mkFnX`
functions from `purescript-functions`:

    module Uncurried (multiply) where
    
    import Prelude ((*))
    import Data.Function (mkFn2, Fn2(..))
    
    -- mkFn2 :: forall a b c. (a -> b -> c) -> Fn2 a b c
    
    multiply :: Fn2 Int Int Int
    multiply = mkFn2 multiply'
    
    multiply' :: Int -> Int -> Int
    multiply' x y = x * y

And now we can use this as a JavaScript function of two arguments:

    > require("output/Uncurried").multiply(3,5)
    15

PureScript tries to preserve names as much as it can, but JavaScript has
different restrictions on names than PureScript so some translation is needed.
In particular, reserved names are prefixed with `$$` (`null` -> `$$null`) and
symbols with its `$`-prefixed name (`alice'` -> `alice$prime`).
