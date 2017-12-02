module Main where

import Data.Char ( digitToInt )
import System.Environment ( getArgs )
import Lib

main :: IO ()
main = do
  [input] <- getArgs
  let result = computeInverseCaptcha ( fmap digitToInt input )
  print result
