module Euler
  ( primes
  )
where


-- primes generation

primes :: [Integer]
primes = 2 : 3 : ((spin wheel23 5) `minus` composites)
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
