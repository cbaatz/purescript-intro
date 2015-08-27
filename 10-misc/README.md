Miscellaneous
=============

There are several minor differences to Haskell and other things that we won't
cover in detail but are still worth noting:

- The type hierarchy is [more granular than
  Haskell's](http://pursuit.purescript.org/packages/purescript-control/0.3.0).
- Typeclasses with a superclass use `<=` instead of Haskell's `=>` to express
  dependencies in `class (Eq a) <= Ord a where`.
- The compiler performs tail-call elimination.
- Type variables must be explicitly declared with `forall`.
- No syntactic sugar for the `Array` *type* (but array values have it).
- No syntactic sugar for list comprehensions -- use `do` notation instead.
- `()` in Haskell is `Unit` in PureScript.
- `head` and similar functions are total (return `Maybe`s) by default.
- The functor map function is simply called `map` instead of `fmap` as in
  Haskell.
- Operators must be defined with parentheses: `($) f x = f x` (not `f $ x = f
  x`).
- Function composition is `<<<` rather than `.` to avoid syntactic ambiguity
  with record proprty access and name qualification. (`<<<` is actually more
general than `.`.)

- PureScript does not support language extensions, but support (approximately)
  the following Haskell-equivalents by default:
  - EmptyDataDecls
  - ExplicitForAll
  - FlexibleContexts
  - FlexibleInstances
  - MultiParameterTypeClasses
  - PartialTypeSignatures
  - RankNTypes
  - ScopedTypeVariables

Most of the above are from the PureScript Wiki's [*Differences from
Haskell*](https://github.com/purescript/purescript/wiki/Differences-from-Haskell)
page.
