import           Euler


factors :: Integer -> [Integer]
factors n = filter (\p -> n `mod` p == 0) $ takeWhile (<= limit) primes
  where limit = floor . sqrt . fromIntegral $ n


solution :: Integer
solution = last . factors $ 600851475143
