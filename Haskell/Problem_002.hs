-- canonical implementation of Fibonacci
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)


sumEvenFibsUnder :: Integer -> Integer
sumEvenFibsUnder limit = sum $ takeWhile (< limit) $ filter isEven fibs
  where isEven = (\x -> x `mod` 2 == 0)


solution = sumEvenFibsUnder 4000000
