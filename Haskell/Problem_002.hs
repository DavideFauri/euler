-- Find the sum of all the even-valued terms in the Fibonacci sequence which do not exceed four million.


-- canonical implementation of Fibonacci
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)


sumEvenFibsUnder :: Integer -> Integer
sumEvenFibsUnder limit = sum $ takeWhile (<= limit) $ filter even fibs


main :: IO ()
main = do
  print $ sumEvenFibsUnder 4000000
