Type classes
============

Type classes in PureScript are similar to those in Haskell:

```purescript
class Functor f where
  map :: forall a b. (a -> b) -> f a -> f b
```

Instances must be named:

```purescript
instance functorMaybe :: Functor Maybe where
  map fn (Just x) = Just (fn x)
  map _  _        = Nothing
```

JavaScript representation
-------------------------

To use PureScript you don't need to know how typeclasses are compiled to
JavaScript, but it's nice to know what happens under the hood so we'll have a
quick look.

Consider a dummy typeclass with two functions and two instances, one for `Int`
and one for `String`.

```purescript
class Foo a where
  foo :: a -> String
  qux :: a -> Int

instance stringFoo :: Foo String where
  foo s = "Foo" ++ s
  qux s = length s

instance intFoo :: Foo Int where
  foo x = "It's just an Int."
  qux x = x + 10
```

This creates a JavaScript class `Foo` which expects to receive concrete
instances of the two functions `foo` and `qux` on instantiation and assigns
these to member variables of the respective name.

```javascript
var Foo = function (foo, qux) {
    this.foo = foo;
    this.qux = qux;
};
```

An instance, like the `stringFoo` instance above, simply instantiates the
JavaScript `Foo` class with the functions used for strings:

```javascript
var stringFoo = new Foo(function (s) {
    return "Foo" + s;
}, function (s) {
    return Data_String.length(s);
});
```

The trick is that all typeclass functions requires an extra *dictionary*
argument as its first argument. It uses this to simply look up the
corresponding function in the dictionary it is passed:

```javascript
var qux = function (dict) {
    return dict.qux;
};
var foo = function (dict) {
    return dict.foo;
};
```

It is the PureScript compiler's job to make sure the right dictionary is passed
into the function, depending on the type of its argument. For example:

```purescript
bar :: String
bar = foo "Bob"

baz :: String
baz = foo 3
```

Compiles to:

```javascript
var bat = qux(stringFoo)("WAT");
var bar = foo(stringFoo)("Bob");
```
