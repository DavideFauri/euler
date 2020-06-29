-- What is the value of the first triangle number to have over five hundred divisors?
import           System.IO
import           Euler                          ( factorize )
import           Data.List                      ( find
                                                , group
                                                )


triangleNumbers :: [Integer]
triangleNumbers = scanl1 (+) [1 ..]


triangleWithMoreThanNDivisors :: Int -> Maybe Integer
triangleWithMoreThanNDivisors n = find ((> n) . nDivisors) triangleNumbers


nDivisors :: Integer -> Int
nDivisors = product . map (+ 1) . countPrimes
  where countPrimes = map length . group . factorize -- count how many of each prime factor


main :: IO ()
main = do
  print $ triangleWithMoreThanNDivisors 500
