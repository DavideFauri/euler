-- Evaluate the sum of all the amicable numbers under 10000
import           Euler                          ( divisors )


amicables :: [(Integer, Integer)]
amicables =
  [ (a, b)
  | a <- [1 ..]
  , let b = sum (divisors a)
  , a == sum (divisors b)
  , a < b
  ]


sumAmicablesUnder :: Integer -> Integer
sumAmicablesUnder n = sum . map sumTuple $ amicableTuples
 where
  amicableTuples = takeWhile ((< n) . snd) amicables
  sumTuple (a, b) = a + b


main :: IO ()
main = do
  print $ sumAmicablesUnder 10000
