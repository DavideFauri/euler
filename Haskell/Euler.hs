module Euler
  ( fibonacci
  , factorial
  , primes
  , factorize
  , divisors
  , binomial
  )
where
import           Data.List                      ( nub )
import           Data.Ratio                     ( (%) )


-- canonical implementation of Fibonacci
fibonacci :: [Integer]
fibonacci = 0 : 1 : zipWith (+) fibonacci (tail fibonacci)


-- factorial
factorial :: Integer -> Integer
factorial 1 = 1
factorial n = n * factorial (n - 1)


-- primes generation
primes :: [Integer]
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


-- factorization
factorize :: Integer -> [Integer]
factorize 1 = []
factorize n = divisor : factorize (n `quot` divisor)
  where divisor = head $ filter (\p -> n `mod` p == 0) primes


-- divisors of a number
divisors :: Integer -> [Integer]
divisors n =
  let bound = floor . sqrt . fromInteger $ n
  in  nub $ foldl (++)
                  [1]
                  [ [d, n `quot` d] | d <- [2 .. bound], n `mod` d == 0 ]


-- n choose k
-- https://stackoverflow.com/questions/28896626/tail-recursive-binomial-coefficient-function-in-haskell
binomial :: Integer -> Integer -> Integer
binomial = loop (toRational 1)
 where
  loop :: Rational -> Integer -> Integer -> Integer
  loop r _ 0 = round r
  loop _ 0 _ = 0
  loop r n k = loop (r * (n % k)) (n - 1) (k - 1)
