This overview aims to explain what PureScript is and the basics of how to use
it for those familiar with Haskell and JavaScript. This is not trying to make
an argument for functional programming, nor is it an exhaustive overview of
PureScript. For the former see [*Why Functional Programming
Matters*](https://www.cs.kent.ac.uk/people/staff/dat/miranda/whyfp90.pdf) and
for the latter see [*PureScript by
Example*](https://leanpub.com/purescript/read).

My goal is that you come away from this talk with a basic understanding for how
PureScript works and the ability to judge whether it would be a good fit a
particular project.

Our focus will be on writing programs for browsers. Though PureScript can be
used on the backend with Node, I don't see any good reasons to prefer it over
Haskell in new projects. For browser code however, I think PureScript has
chosen a compelling set of trade-offs.

Finally, I'm not a PureScript expert. Despite that I hope I'll be able to
explain its core features and save you some investigation time.

What is PureScript?
-------------------

PureScript is a Haskell-like language that compiles to JavaScript.

All languages make trade-offs between things like features, ease-of-learning,
ease-of-use, runtime performance, and implementation cost. PureScript borrows
trade-offs from Haskell:

- Safety and expressivity over requiring a non-trivial compiler.
- Ease-of-use (ease-of-reasoning) over ease-of-learning.

Frankly, PureScript tries to be Haskell, but with one important exception:

> PureScript uses JavaScript runtime semantics: single-threaded, strict
> evaluation, and JavaScript data primitives (Number, String, and objects).

This choice has important implications, both good and bad:

- No runtime required.
- Integrates well with existing JavaScript codebases.

- Defines a new language that can't reuse Haskell libraries or code.
- Similar to Haskell, but not the same which can lead to confusion.
- Can't use Haskell's compiler infrastructure.
- Doesn't benefit from Haskell's runtime features such as laziness or
  concurrency capabilities.

The PureScript compiler is written in Haskell. Phil Freeman is its author and
primary developer: https://github.com/paf31 https://twitter.com/paf31.

Why PureScript?
---------------

If you need to produce JavaScript code -- say because you target web browsers
or if you already have an existing JavaScript codebase that you need to play
well with -- PureScript gives you a way to use a functional, strongly typed
langauge to do so.

PureScript lives in the Node ecosystem and produces runtime-less code. It is
therefore particularly suited for browser programs in mixed environments.  You
could use PureScript for a part of your application and keep other parts in
JavaScript, ClojureScript, or whatever you or your libraries currently use.  Or
you can write your whole client application in PureScript only.

With Node, you can use PureScript on the backend, though I would much rather
use Haskell (and GHC) there since it is more mature and powerful.  PureScript
might, however, be compelling if you need to incrementally improve on an
existing JavaScript or ClojureScript codebase.

Basically, if you wished you could use Haskell to write browser programs,
PureScript might be for you. If you prefer (or are not bothered by) different
runtime semantics (and its implications), then there are other options like Elm
and GHCJS that you should consider.

Personally, I think PureScript has the potential to expand the use and
acceptance of strongly typed functional languages. Nowadays, most projects need
(often non-trivial) JavaScript code for browser applications. I suspect
PureScript might be one of the most practical ways to introduce functional
programming to a production project.
