-- Find the largest prime factor of a composite number.
import           Euler                          ( primes )


factors :: Integer -> [Integer]
factors 0 = []
factors 1 = []
factors n = factor : factors (n `div` factor)
  where factor = head $ filter (\p -> n `mod` p == 0) primes


main :: IO ()
main = do
  print $ last $ factors $ 600851475143
