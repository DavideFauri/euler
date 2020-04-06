import           Euler                          ( primes )


sumPrimesBelow :: Integer -> Integer
sumPrimesBelow limit = sum $ takeWhile (< limit) primes


solution = sumPrimesBelow 2000000
