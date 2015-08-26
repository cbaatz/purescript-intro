module Import.Data where

import Prelude
import Data.Foreign
import Data.Foreign.Class

data FooBar = FooBar Int String

instance showFooBar :: Show FooBar where
  show (FooBar i s) = "FooBar " ++ (show i) ++ " " ++ s

instance isForeignFooBar :: IsForeign FooBar where
  read value = do
    foo <- readProp "foo" value
    bar <- readProp "bar" value
    return $ FooBar foo bar

foreign import getValue :: Boolean -> Foreign
