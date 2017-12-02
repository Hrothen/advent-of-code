import Test.Hspec

import Lib

main :: IO ()
main = hspec $ do
  describe "Part 1" $ do
    it "computes the given example correctly" $
      checksum [[5,1,9,5], [7,5,3], [2,4,6,8]] `shouldBe` 18
