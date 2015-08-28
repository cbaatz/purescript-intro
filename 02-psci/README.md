psci
====

Haskell has `ghci`, PureScript has `psci` -- an interactive REPL useful for
testing, exploring, and experimenting with code.

By default, `psci` doesn't load *any* libraries, so you can't do very much
without loading some libraries. You can load libraries manually from the REPL
using `:l` (and `:f` for the foreign files) or you can specify them via a glob
on startup (similar to how you use the compiler):

    psci       'bower_components/purescript-*/src/**/*.purs' \
         --ffi 'bower_components/purescript-*/src/**/*.js' \
               'src/purs/**/*.purs' \
         --ffi 'src/purs/**/*.js'

Note that pressing `<TAB>` will show you the available completions (often the
names in scope). I've found that to be particularly helpful. `psci` has a few
other useful commands that you can list with the `:?` command. 

If you're working on a project, you can keep a `.psci` file that tells `psci`
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

When you've loaded a module, you can use its members fully qualified:

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

If you use a `.psci` file, you would usually set up your build system to
generate it to reflect your sources and the modules you have installed.
`gulp-purescript` and Pulp have support for this.
