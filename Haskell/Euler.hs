{-# LANGUAGE ScopedTypeVariables #-}

module Euler
  ( fibonacci
  , factorial
  , primes
  , isPrime
  , factorize
  , divisors
  , binomial
  )
where
import           Data.List                      ( nub )
import           Data.Ratio                     ( Ratio
                                                , (%)
                                                )


-- fast implementation of Fibonacci as matrix multiplication
data Matrix a = Matrix a a a

upperRight :: Matrix a -> a
upperRight (Matrix _ a _) = a

times :: Num a => Matrix a -> Matrix a -> Matrix a
times (Matrix a b c) (Matrix x y z) = Matrix (a * x + by)
                                             (a * y + b * z)
                                             (by + c * z)
  where by = b * y

fibonacci :: Integral a => [a]
fibonacci = 0 : map upperRight (scanl1 times (repeat (Matrix 1 1 0)))


-- factorial
factorial :: Integral a => a -> a
factorial n = product [1 .. n]


-- primes generation
primes :: Integral a => [a]
primes = 2 : 3 : spin wheel23 5 `minus` composites
 where
  spin (x : xs) n = n : spin xs (n + x)
  wheel23    = 2 : 4 : wheel23
  composites = union [ multiples p | p <- primes ]
  multiples n = map (n *) [n ..]
  (x : xs) `minus` (y : ys) | x < y  = x : (xs `minus` (y : ys))
                            | x == y = xs `minus` ys
                            | x > y  = (x : xs) `minus` ys
  union = foldr merge []   where
    merge (x : xs) ys = x : merge' xs ys
    merge' (x : xs) (y : ys) | x < y  = x : merge' xs (y : ys)
                             | x == y = x : merge' xs ys
                             | x > y  = y : merge' (x : xs) ys


isPrime :: Integral a => a -> Bool
isPrime n | n < 0     = False
          | otherwise = all (\p -> n `mod` p /= 0) (takeWhile (<= limit) primes)
  where limit = floor . sqrt $ fromIntegral n


-- factorization
factorize :: Integral a => a -> [a]
factorize 1 = []
factorize n = divisor : factorize (n `quot` divisor)
  where divisor = head $ filter (\p -> n `mod` p == 0) primes


-- divisors of a number
divisors :: Integral a => a -> [a]
divisors n =
  nub . foldl (++) [1] $ [ [d, n `quot` d] | d <- [2 .. bound], n `mod` d == 0 ]
  where bound = floor . sqrt $ fromIntegral n


-- n choose k
-- https://stackoverflow.com/questions/28896626/tail-recursive-binomial-coefficient-function-in-haskell
binomial :: forall a . Integral a => a -> a -> a
binomial = loop 1
 where
  loop :: Ratio a -> a -> a -> a
  loop r _ 0 = round r
  loop _ 0 _ = 0
  loop r n k = loop (r * (n % k)) (n - 1) (k - 1)
