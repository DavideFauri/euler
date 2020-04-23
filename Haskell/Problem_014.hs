-- Which starting number, under one million, produces the longest Collatz chain?
import           System.IO
import           Data.MemoTrie


lenCollatz :: (Int -> Int) -> Int -> Int
lenCollatz collatz 0 = 0
lenCollatz collatz 1 = 1
lenCollatz collatz n | even n    = 1 + collatz (n `div` 2)
                     | otherwise = 1 + collatz (3 * n + 1)


memoizedLenCollatz :: Int -> Int
memoizedLenCollatz = memoFix lenCollatz


listOfLenCollatz :: [Int]
listOfLenCollatz = map memoizedLenCollatz [0 ..]


indexOfMaximum :: [Int] -> Int
indexOfMaximum list = snd $ maximum $ zip list [0 ..]


longestCollatzBelow :: Int -> Int
longestCollatzBelow limit = indexOfMaximum $ take limit listOfLenCollatz


main :: IO ()
main = do
  print $ longestCollatzBelow 1000000
