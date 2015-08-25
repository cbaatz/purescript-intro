Pursuit
=======

PureScript's equivalent to Haskell's Hoogle is
[*Pursuit*](http://pursuit.purescript.org/). Just like Hoogle you can search
using either names or type signatures:
  
    http://pursuit.purescript.org/search?q=%2B
    http://pursuit.purescript.org/search?q=Int+-%3E+Int+-%3E+Int

If you want programmatic access you can get the output in JSON format:

    curl -H 'Accept: application/json' http://pursuit.purescript.org/search?q=Int+-%3E+Int+-%3E+Int
