import Test.Hspec

import Lib

main :: IO ()
main = hspec $ do
  describe "Part 1" $ do
    it "computes the given example correctly" $
      checksum [[5,1,9,5], [7,5,3], [2,4,6,8]] `shouldBe` 18
  describe "Part 2" $ do
    it "computes the given example correcctly" $
      checksumMod [[5,9,2,8], [9,4,7,3], [3,8,6,5]] `shouldBe` 9
