import           System.IO
import           Euler                          ( factorize )
import           Data.List                      ( group )


triangleNumbers :: [Integer]
triangleNumbers = scanl1 (+) [1 ..]


triangleWithNDivisors :: Integer -> Integer
triangleWithNDivisors limit =
  head $ dropWhile (\t -> nDivisors t <= limit) triangleNumbers


nDivisors :: Integer -> Integer
nDivisors n = product [ toInteger c + 1 | c <- countPrimes ]
  where countPrimes = map length $ group $ factorize n


main :: IO ()
main = do
  print $ triangleWithNDivisors 500
