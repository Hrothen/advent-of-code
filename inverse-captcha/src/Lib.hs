module Lib
    ( computeInverseCaptcha
    , computeJumpingSum
    ) where

import Data.List ( cycle )

computeInverseCaptcha :: [Int] -> Int
computeInverseCaptcha [] = 0
computeInverseCaptcha [_] = 0
computeInverseCaptcha ints = sumPairs $ take (len + 1) (cycle ints)
  where len = length ints

sumPairs :: [Int] -> Int
sumPairs [] = 0
sumPairs [_] = 0
sumPairs (x:y:ls) = s + sumPairs (y:ls)
  where
  s = if x == y
        then x
        else 0

computeJumpingSum :: [Int] -> Int
computeJumpingSum ints = sum (take len (zipWith (\x y -> if x == y then x else 0) ints' (drop (len `div` 2) ints')))
  where
    len   = length ints
    ints' = cycle ints
