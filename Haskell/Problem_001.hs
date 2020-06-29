-- Add all the natural numbers below one thousand that are multiples of 3 or 5.
import           Data.List                      ( union )


-- O(1) version for just two factors
sumFizzBuzz :: Integer -> Integer -> Integer -> Integer
sumFizzBuzz a b limit = multA + multB - multAB where
  multA  = sumMultiplesBelow a limit
  multB  = sumMultiplesBelow b limit
  multAB = sumMultiplesBelow (lcm a b) limit
  sumMultiplesBelow n l = n * cap * (cap + 1) `div` 2
    where cap = ceiling (fromIntegral l / fromIntegral n) - 1


-- O(m*n) version for m factors
sumFizzBuzzEtc :: [Integer] -> Integer -> Integer
sumFizzBuzzEtc factors limit = sum $ foldl1 union multiples
 where
  multiples = [ multiplesOf n | n <- factors ]
  multiplesOf n = takeWhile (< limit) $ map (n *) [1 ..]


main :: IO ()
main = do
  print $ sumFizzBuzz 3 5 1000
  print $ sumFizzBuzzEtc [3, 5] 1000
