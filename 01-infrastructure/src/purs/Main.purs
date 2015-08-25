module Main where

import Prelude
import Control.Monad.Eff.Console (log)

import qualified Computation.Double as Comp

main = do
  let x = Comp.double 21
  log "Hello, PureScript!"
  log (show x)
