module Functions (multiply) where

import Prelude ((*))
import Data.Function (mkFn2, Fn2(..))

-- mkFn2 :: forall a b c. (a -> b -> c) -> Fn2 a b c

multiply :: Fn2 Int Int Int
multiply = mkFn2 multiply'

multiply' :: Int -> Int -> Int
multiply' x y = x * y
