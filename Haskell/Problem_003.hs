import           Euler


factors :: Integer -> [Integer]
factors 0 = []
factors 1 = []
factors n = f : factors (n `div` f)
  where f = head $ filter (\p -> n `mod` p == 0) primes


main :: IO ()
main = do
  print $ last $ factors $ 600851475143
