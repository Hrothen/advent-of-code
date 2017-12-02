module Main where

import Data.Semigroup ((<>))
import Options.Applicative

import Lib

data Part = One | Two
  deriving (Read, Show, Eq)

data Input = Input
  { part  :: Part
  , sheet :: String
  }  deriving (Read, Show, Eq)

input :: Parser Input
input = Input <$> flag One Two
  (  long "part2"
  ) <*>
  argument str (metavar "FILE")

main :: IO ()
main = check =<< execParser opts
  where
    opts = info input
      (  fullDesc
      <> progDesc "compute checksum"
      )

check (Input p s) = do
  spreadSheet <- readSpreadsheet s
  case p of
    One -> print $ checksum spreadSheet
    Two -> print $ checksumMod spreadSheet

readSpreadsheet :: String -> IO [[Integer]]
readSpreadsheet filename = do
  s <- readFile filename
  let sheet = fmap words $ lines s
      spreadSheet = (fmap (fmap read) sheet) :: [[Integer]]
  return spreadSheet
