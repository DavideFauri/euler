-- What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral?
import           Data.List                      ( foldl' )

fourCorners :: Integer -> Integer
fourCorners n = 4 * n ^ 2 - 6 * (n - 1)

sumDiagonalsSpiral :: Integer -> Integer
sumDiagonalsSpiral side = sum $ 1 : [ fourCorners n | n <- [3, 5 .. side + 1] ]


main :: IO ()
main = do
  print $ sumDiagonalsSpiral 1001
