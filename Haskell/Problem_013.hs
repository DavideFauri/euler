-- Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
import           System.IO


parseNumbers :: String -> [Integer]
parseNumbers = map read . lines


firstNDigits :: Int -> Integer -> Integer
firstNDigits n = read . take n . show


main :: IO ()
main = do
  withFile
    "../data/data_013.txt"
    ReadMode
    (\h -> do
      fileContents <- hGetContents h
      let largeNumbers = parseNumbers fileContents
      print $ firstNDigits 10 $ sum largeNumbers
    )
