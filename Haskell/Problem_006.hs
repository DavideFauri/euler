-- Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


difference :: Integer -> Integer
difference n = abs $ sumOfSquares n - squareOfSum n
 where
  sumOfSquares n = sum $ map (^ 2) [1 .. n]
  squareOfSum n = ((n + 1) * n `div` 2) ^ 2


main :: IO ()
main = do
  print $ difference 100
