-- Find the sum of all the primes below two million
import           Euler                          ( primes )


sumPrimesBelow :: Integer -> Integer
sumPrimesBelow limit = sum $ takeWhile (< limit) primes


main :: IO ()
main = do
  print $ sumPrimesBelow 2000000
