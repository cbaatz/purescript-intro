module TypeClasses.Foo where

import Prelude
import Data.String (length)
import Data.Maybe

class Foo a where
  foo :: a -> String
  qux :: a -> Int

instance stringFoo :: Foo String where
  foo s = "Foo" ++ s
  qux s = length s

instance intFoo :: Foo Int where
  foo x = "It's just an Int."
  qux x = x + 10

bar :: String
bar = foo "Bob"

baz :: String
baz = foo 3

bat :: Int
bat = qux "WAT"

bag :: Int
bag = qux 32
