difference :: Integer -> Integer
difference n = abs $ sumOfSquares n - squareOfSum n
 where
  sumOfSquares n = sum [ n ^ 2 | n <- [1 .. n] ]
  squareOfSum n = ((n + 1) * n `div` 2) ^ 2


main :: IO ()
main = do
  print $ difference 100
