module Main where

import Data.Char ( digitToInt )
import System.Environment ( getArgs )
import Lib

main :: IO ()
main = do
  [flag, input'] <- getArgs
  let input = fmap digitToInt input'
      result = case flag of
        "1" -> computeInverseCaptcha input
        "2" -> computeJumpingSum input
        _   -> error "unrecognized flag"
  print result
