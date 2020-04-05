import           Euler                          ( primes )


nthPrime :: Int -> Integer
nthPrime n = primes !! (n - 1)


solution = nthPrime 10001
