-- Find the greatest product of thirteen consecutive digits in the 1000-digit number
import           System.IO
import           Data.Char                      ( digitToInt )


greatestProductOfLength :: Int -> String -> Int
greatestProductOfLength len numstr =
  maximum . map productString $ makeStreaks len numstr


productString :: String -> Int
productString = product . map digitToInt


makeStreaks :: Int -> [a] -> [[a]]
makeStreaks len = filter isActuallyLen . map (take len) . sequentialDrop
 where
  isActuallyLen xs = length xs == len
  sequentialDrop xs = [ drop n xs | n <- [0 .. (length xs) - len] ]


main :: IO ()
main = do
  withFile
    "../data/data_008.txt"
    ReadMode
    (\h -> do
      fileContents <- hGetContents h
      let largeNumber = head . lines $ fileContents
      print $ greatestProductOfLength 13 largeNumber
    )
