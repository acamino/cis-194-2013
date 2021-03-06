module CIS194.Week06.FibonacciSpec where

import CIS194.Week06.Fibonacci
import Test.Hspec

spec :: Spec
spec = do
  describe "fibs1" $
    it "computes the 10 first fibonacci numbers" $
      take 10 fibs1 `shouldBe` [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

  describe "fibs2" $
    it "computes the nth fibonacci number" $ do
      fibs2 !! 100 `shouldBe` 354224848179261915075
      fibs2 !! 150 `shouldBe` 9969216677189303386214405760200

  describe "streamToList" $
    it "converts a stream into a list" $
      let stream = streamRepeat 10
      in (take 2 . streamToList $ stream) `shouldBe` [10, 10]

  describe "show" $
    it "conveniently prints the first 20 elements in a stream" $
      let stream = streamRepeat 10
      in show stream `shouldBe` (show [10 | _ <- [1..20]])

  describe "streamMap" $
    it "maps a function to the elements in a stream" $
      let stream = streamRepeat 6
      in (show $ streamMap (+2) stream) `shouldBe` (show [8 | _ <- [1..20]])

  describe "streamFromSeed" $
    it "generates a stream form a given seed" $
      let stream = streamFromSeed (+2) 2
      in show stream `shouldBe` show [x * 2 | x <- [1..20]]

  describe "nats" $
    it "generates an infinite list of natural numbers" $
      show nats `shouldBe` show [0..19]

  describe "ruler" $
    it "generates a ruler" $
      show ruler `shouldBe` show [0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2]
