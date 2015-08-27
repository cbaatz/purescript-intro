module Effects.PrintRandom where

import Prelude

import Control.Monad.Eff
import Control.Monad.Eff.Random (random)
import Control.Monad.Eff.Console (print)

printRandom = do
  n <- random
  print n
