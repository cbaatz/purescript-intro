psci
====

Haskell has `ghci`, PureScript has `psci` -- an interactive REPL useful for
testing, exploring, and experimenting with code.

By default, `psci` doesn't load *any* libraries, so can't do very much at
first.  You can load libraries manually from the REPL using `:l` (and `:f` for
the foreign files), but it's easier to keep a `.psci` file that tells `psci`
which files to load on startup (`:m` for a PureScript module `:f` for a foreign
module):

    cat .psci

    :m src/purs/Main.purs
    :m ../bower_components/purescript-console/src/Control/Monad/Eff/Console.purs
    :m ../bower_components/purescript-eff/src/Control/Monad/Eff.purs
    :m ../bower_components/purescript-eff/src/Control/Monad/Eff/Class.purs
    :m ../bower_components/purescript-eff/src/Control/Monad/Eff/Unsafe.purs
    :m ../bower_components/purescript-prelude/src/Prelude.purs
    :f ../bower_components/purescript-console/src/Control/Monad/Eff/Console.js
    :f ../bower_components/purescript-eff/src/Control/Monad/Eff.js
    :f ../bower_components/purescript-eff/src/Control/Monad/Eff/Unsafe.js
    :f ../bower_components/purescript-prelude/src/Prelude.js

This means you can use members of these modules fully qualified:

    psci

    > 1 Prelude.+ 1
    2

To bring members into scope, use `import`:

    > import Prelude
    > 1 + 1
    2

    > import Main
    > hello
    Hello, psci!
    unit

In most cases you'll probably want to set up your build system to automatically
write the `.psci` file so that it reflect your sources and the modules you have
installed.
