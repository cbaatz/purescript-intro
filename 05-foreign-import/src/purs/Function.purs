module Import.Function where

import Data.Function (Fn2(..))

foreign import multiplyCurried :: Number -> Number -> Number
foreign import multiplyUncurried :: Fn2 Number Number Number
