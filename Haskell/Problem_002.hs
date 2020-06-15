-- Find the sum of all the even-valued terms in the Fibonacci sequence which do not exceed four million.
import           Euler                          ( fibonacci )


sumEvenFibsUnder :: Integer -> Integer
sumEvenFibsUnder limit = sum $ takeWhile (<= limit) $ filter even fibonacci


main :: IO ()
main = do
  print $ sumEvenFibsUnder 4000000
