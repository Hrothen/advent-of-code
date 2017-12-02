import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
  describe "Inverse Captcha" $ do
    it "works with the given examples" $ do
      computeInverseCaptcha [1,1,2,2] `shouldBe` 3
      computeInverseCaptcha [1,1,1,1] `shouldBe` 4
      computeInverseCaptcha [1,2,3,4] `shouldBe` 0
      computeInverseCaptcha [9,1,2,1,2,1,2,9] `shouldBe` 9
  describe "Inverse Captcha part 2" $  do
    it "works with the given examples" $ do
      computeJumpingSum [1,2,1,2] `shouldBe` 6
      computeJumpingSum [1,2,2,1] `shouldBe` 0
      computeJumpingSum [1,2,3,4,2,5] `shouldBe` 4
      computeJumpingSum [1,2,3,1,2,3] `shouldBe` 12
      computeJumpingSum [1,2,1,3,1,4,1,5] `shouldBe` 4
