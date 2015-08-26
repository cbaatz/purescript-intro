module Export.Primitive
  ( string
  , number
  , boolean
  , int
  , array
  , record
  , recordAltSyntax
  , arrayTriple
  ) where

string :: String
string = "Hello, PureScript!"

number :: Number
number = 3.14159

boolean :: Boolean
boolean = true

int :: Int
int = 42

array :: Array Int
array = [1,2,3]

record :: Object ( foo :: Int, bar :: String )
record = { foo: 1, bar: "quux" }

recordAltSyntax :: { foo :: Int, bar :: String }
recordAltSyntax = { foo: 1, bar: "quux" }

arrayTriple :: forall a. a -> Array a
arrayTriple x = [x, x, x]
