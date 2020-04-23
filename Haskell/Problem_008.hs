-- Find the greatest product of thirteen consecutive digits in the 1000-digit number
import           System.IO
import           Data.Char                      ( digitToInt )


greatestProductOfLength :: Int -> String -> Int
greatestProductOfLength len numstr =
  maximum $ map productString $ makeStreaks len numstr


productString :: String -> Int
productString numstr = product $ map digitToInt numstr


makeStreaks :: Int -> String -> [String]
makeStreaks len str =
  let shiftAmounts = [0 .. (length str) - len]
  in  map (take len) $ map (\shift -> drop shift str) shiftAmounts


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
