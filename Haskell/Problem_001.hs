-- Add all the natural numbers below one thousand that are multiples of 3 or 5.
import           Data.List                      ( union )


sumFizzBuzz :: Integer -> Integer -> Integer -> Integer
sumFizzBuzz a b limit = sum $ union (multiplesOf a) (multiplesOf b)
  where multiplesOf n = takeWhile (< limit) $ map (n *) [1 ..]


main :: IO ()
main = do
  print $ sumFizzBuzz 3 5 1000
