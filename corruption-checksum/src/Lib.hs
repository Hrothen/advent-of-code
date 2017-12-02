module Lib
    ( checksum
    ) where

import qualified Control.Foldl as F

minMax :: F.Fold Integer (Maybe Integer,Maybe Integer)
minMax = (,) <$> F.minimum <*> F.maximum

rowCheck :: Foldable f => f Integer -> Integer
rowCheck = (\(Just min,Just max)-> max - min) . F.fold minMax

checksum :: (Foldable outer, Foldable inner) => outer (inner Integer) -> Integer
checksum = F.fold (F.premap rowCheck F.sum)
