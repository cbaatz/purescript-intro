PureScript introduction
=======================

This introduction aims to explain what PureScript is and how it can be used for
those familiar with Haskell and JavaScript. The notes were originally written
as the basis of a talk, but they should be fairly self-contained. Each section
has its own folder, often with example files that you can run and inspect.

*Please don't hesitate to open issues (or send pull requests) for errors or
parts that are confusing.*

My goal is that you come away from this introduction with a basic understanding
for how PureScript works and with the ability to judge whether PureScript would
be a good fit for a project.

I will not make an argument for functional programming in general, nor is this
an exhaustive look at PureScript. For the former see [*Why Functional
Programming
Matters*](https://www.cs.kent.ac.uk/people/staff/dat/miranda/whyfp90.pdf) and
for the latter see [*PureScript by
Example*](https://leanpub.com/purescript/read).

Finally, I'm not a PureScript expert. Despite that I hope I'll be able to
explain its core features and save you some time investigating on your own.

What is PureScript?
-------------------

PureScript is a Haskell-like language that compiles to JavaScript.

All languages make trade-offs between things like features, ease-of-learning,
ease-of-use, runtime performance, and implementation cost. PureScript borrows
trade-offs from Haskell:

- Safety and expressivity over having a simple compiler.
- Ease-of-use (ease-of-reasoning) over ease-of-learning.

Frankly, PureScript tries to be Haskell, but with an important exception:

> PureScript uses JavaScript runtime semantics: single-threaded, strict
> evaluation, and JavaScript data primitives (Number, String, and objects).

This choice has important implications, both good and bad:

- No runtime required.
- Integrates well with existing JavaScript codebases.
- Potential for producing small and efficient code.
- Defines a new language that can't reuse Haskell libraries or code.
- Similar to Haskell, but not the same which can lead to confusion.
- Can't use Haskell's compiler infrastructure.
- Doesn't benefit from Haskell's runtime features such as laziness or
  concurrency capabilities.

The PureScript compiler is written in Haskell. Phil Freeman (paf31)
([GitHub](https://github.com/paf31), [Twitter](https://twitter.com/paf31)) is
its author. Most of the development is done by Phil Freeman and Gary Burgess
(garyb) ([GitHub](https://github.com/garyb)).

Why PureScript?
---------------

If you need to produce JavaScript code -- say because you target web browsers
or if you already have an existing JavaScript codebase that you need to play
well with -- PureScript gives you a way to use a functional, strongly typed
langauge to do so.

PureScript lives in the Node ecosystem and produces runtime-less code. It is
therefore particularly suited for browser programs in mixed environments.  You
could use PureScript for a part of your application and keep other parts in
JavaScript, ClojureScript, or whatever you or your libraries currently use. Or
you can write your whole client application in PureScript only.

With Node, you can also use PureScript on the backend, though I don't see much
reason to choose PureScript over the more mature and powerful Haskell (and
GHC). PureScript might, however, be compelling if you need to incrementally
improve on an existing JavaScript or ClojureScript backend.

Do note that PureScript is a young project that hasn't yet proven itself in a
wide range of real-world scenarios.  There is also strong competition from
solutions like [GHCJS](https://github.com/ghcjs/ghcjs) and
[Elm](http://elm-lang.org/) that take a different approach to improving browser
development.

I think PureScript might have the potential to significantly expand the use and
comfort with strongly typed functional languages. Because it lives in the Node
eco-system and produces readable JavaScript, I suspect many will find it less
intimidating than Haskell. Given the large number JavaScript projects, this
will hopefully encourage more people to learn and use strongly typed functional
languages.

## Table of Contents

- [Infrastructure](./01-infrastructure/)
- [PSCi](./02-psci/)
- [Pursuit](./03-pursuit/)
- [Foreign Export](./04-foreign-export/)
- [Foreign Import](./05-foreign-import/)
- [Records](./06-records/)
- [Effects](./07-effects/)
- [Type Classes](./08-type-classes/)
- [ADTs](./09-adts/)
- [Miscellaneous](./10-misc/)

Further reading
---------------

- [*PureScript by Example*](https://leanpub.com/purescript/read)
- [Differences from Haskell](https://github.com/purescript/purescript/wiki/Differences-from-Haskell)
- [PureScript wiki](https://github.com/purescript/purescript/wiki)
- [Handling Effects](http://www.purescript.org/learn/eff/)
- [QuickCheck to test JavaScript code](http://www.purescript.org/learn/quickcheck/)
- [The Foreign Function Interface](http://www.purescript.org/learn/ffi/)
- [Getting started using Pulp](http://www.purescript.org/learn/getting-started/)
