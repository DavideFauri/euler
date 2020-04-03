import           Data.List


sumFizzBuzz :: Integer -> Integer -> Integer -> Integer
sumFizzBuzz a b limit = sum $ nub $ firstMultiples ++ secondMultiples where
  firstMultiples  = [1 * a, 2 * a .. limit - 1]
  secondMultiples = [1 * b, 2 * b .. limit - 1]


solution = sumFizzBuzz 3 5 1000
