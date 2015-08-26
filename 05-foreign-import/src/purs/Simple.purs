module Import.Simple where

foreign import string :: String
foreign import integer :: Int
foreign import boolean :: Boolean
foreign import array :: Array Int
foreign import object :: Object ( foo :: Int, bar :: String )
