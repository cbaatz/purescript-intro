module Export.Uncurried
  ( multiply
  ) where

import Prelude ((*))
import Data.Function (mkFn2, Fn2(..))

multiply :: Fn2 Number Number Number
multiply = mkFn2 multiply'

multiply' :: Number -> Number -> Number
multiply' x y = x * y
