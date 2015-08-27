Extensible effects
==================

In Haskell we're strongly encouraged to run impure code in the IO monad.
PureScript lets us specify effects with more granularity in our types using the
`Eff` type constructor. Similar to how `Object` takes a row of types to
construct a record type, `Eff` takes a *row of effects* and returns an effect
type.

    > :t Control.Monad.Eff.Console.log
    forall eff. String -> Eff (console :: CONSOLE | eff) Unit

Here we can see that the console log function takes a string and returns `Unit`
in an effect monad that has *at least* the `CONSOLE` effect. (The log function
is defined in the `purescript-console` package.)

### Example: See how PureScript infers effect types

```purescript
import Control.Monad.Eff
import Control.Monad.Eff.Random (random)
import Control.Monad.Eff.Console (print)

printRandom = do
  n <- random
  print n
```

    > :t printRandom
    forall e. Eff (console :: CONSOLE, random :: RANDOM | e) Unit

### Example: Restrict effects

One of the benefits of this more granular approach to effect tracking is that
we can use the type system to express *what* effects a function is allowed to
run:

```purescript
main :: Eff (console :: CONSOLE, random :: RANDOM) Unit
main = do
  n <- random
  print n
```

Here, we can't accidentially use a function that has any effects other
`CONSOLE` and `RANDOM` in the do-block.

The kind of effects
-------------------

The kind of an `Object` was `# * -> *` so we can expect the kind of `Eff` to
look similar. `Eff` takes a row of *effects* and these have the special kind
`!`:

    > :k Control.Monad.Eff.Eff
    # ! -> * -> *

Custom effects
--------------

Effects allow you to use the type system to enforce the assumptions you're
making about IO code with more granularity than Haskell. You can create new
types of effects for this purpose.

### Example: Create an effect to track localstorage

If you wanted to track use of localstorage, you could add an effect for that:

```purescript
foreign import data LOCALSTORAGE :: !
```

### Example: Import a function with side effects

When we import foreign functions that have effects, we should mark them as such
so that we make the most of the type system we have. For example, using the
`LOCALSTORAGE` effect we defined above, we could write curried `get` and `put`
functions in a foreign module and import them as follows:

```purescript
foreign import get :: forall e. String -> Eff (localstorage :: LOCALSTORAGE | e) Foreign
foreign import put :: forall r e. String -> Object r -> Eff (localstorage :: LOCALSTORAGE | e) Unit
```

Performance
-----------

The PureScript compiler has native support for the `Eff` monad and removes
explicit calls to the bind function for performance.
