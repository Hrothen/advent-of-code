module Lib
    ( checksum
    , checksumMod
    ) where

import Data.List (subsequences)

import qualified Control.Foldl as F

minMax :: F.Fold Integer (Maybe Integer,Maybe Integer)
minMax = (,) <$> F.minimum <*> F.maximum

rowCheck :: Foldable f => f Integer -> Integer
rowCheck = (\(Just min,Just max)-> max - min) . F.fold minMax

checksum :: (Foldable outer, Foldable inner) => outer (inner Integer) -> Integer
checksum = F.fold (F.premap rowCheck F.sum)

-- I'm sure there's a higher order way to do this
getEvenDiv :: [Integer] -> Integer
getEvenDiv [] = error "too few arguments"
getEvenDiv [_] = error "too few arguments"
getEvenDiv [a,b] = let (q,r) = quotRem bigger smaller
                       (bigger, smaller) = if a >= b then (a,b) else (b,a)
                   in if r /= 0 then 0 else q
getEvenDiv _ = error "too many arguments"

rowCheckMod :: [Integer] -> Integer
rowCheckMod = sum . map getEvenDiv . filter (\ls -> length ls == 2) . subsequences

checksumMod :: [[Integer]] -> Integer
checksumMod = F.fold (F.premap rowCheckMod F.sum)
