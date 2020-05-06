-- Evaluate the sum of all the amicable numbers under 10000
import           System.IO
import           Euler                          ( divisors )


amicables :: [(Integer, Integer)]
amicables =
  [ (a, b)
  | a <- [1 ..]
  , let b = sum (divisors a)
  , a == sum (divisors b)
  , b > a
  ]


sumAmicablesUnder :: Integer -> Integer
sumAmicablesUnder n = sum $ listOfTuplesToList amicableTuples
 where
  amicableTuples = takeWhile (\(_, b) -> b < n) amicables
  listOfTuplesToList []            = []
  listOfTuplesToList ((a, b) : xs) = a : b : listOfTuplesToList xs


main :: IO ()
main = do
  print $ sumAmicablesUnder 10000
