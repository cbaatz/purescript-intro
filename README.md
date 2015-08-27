PureScript introduction
=======================

This introduction aims to explain what PureScript is and how it can be used for
those familiar with Haskell and JavaScript.

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
reason to choose PureScript over the more mature and powerful Haskell (and GHC)
for that. PureScript might, however, be compelling if you need to incrementally
improve on an existing JavaScript or ClojureScript backend.

Basically, if you wished you could use Haskell to write browser programs,
PureScript might be for you. If you prefer (or are not bothered by) different
runtime semantics (and their implications), then there are other options like
[Elm](http://elm-lang.org/) and [GHCJS](https://github.com/ghcjs/ghcjs) that
you should also investigate.

Personally, I think PureScript has the potential to significantly expand the
use and acceptance of strongly typed functional languages. Nowadays, most
projects need non-trivial JavaScript code for browser applications. I suspect
PureScript might be one of the most realistic ways to introduce functional
programming to a production project.
