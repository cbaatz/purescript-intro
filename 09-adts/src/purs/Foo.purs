module ADTs.Foo where

data Foo a b = Zero | One a | Two a b

foo = Zero
bar = One "Hello"
baz = Two "Hello" "Goodbye"
