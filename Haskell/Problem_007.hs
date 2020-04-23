-- What is the 10001st prime number?
import           Euler                          ( primes )


nthPrime :: Int -> Integer
nthPrime n = primes !! (n - 1)


main :: IO ()
main = do
  print $ nthPrime 10001
