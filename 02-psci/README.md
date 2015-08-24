psci
====

Haskell has `ghci`, PureScript has `psci` -- an interactive REPL useful for
testing, exploring, and experimenting with code.

    psci

You can specify modules and foreigns that `psci` should load on startup using a
`.psci` file:

    :m src/scripts/Main.purs
    :m bower_components/purescript-console/src/Control/Monad/Eff/Console.purs
    :m bower_components/purescript-eff/src/Control/Monad/Eff.purs
    :m bower_components/purescript-eff/src/Control/Monad/Eff/Class.purs
    :m bower_components/purescript-eff/src/Control/Monad/Eff/Unsafe.purs
    :m bower_components/purescript-prelude/src/Prelude.purs
    :f bower_components/purescript-console/src/Control/Monad/Eff/Console.js
    :f bower_components/purescript-eff/src/Control/Monad/Eff.js
    :f bower_components/purescript-eff/src/Control/Monad/Eff/Unsafe.js
    :f bower_components/purescript-prelude/src/Prelude.js

This means you can use members of these modules fully qualified:

    > 1 Prelude.+ 1
    2

To bring members into scope, use `import`:

    > import Prelude
    > 1 + 1
    2

You probably want to set up your build system to write the `.psci` file to the
project folder.
