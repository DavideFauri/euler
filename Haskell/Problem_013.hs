-- Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
import           System.IO


parseNumbers :: String -> [Integer]
parseNumbers rawString = map read $ lines rawString


firstNDigits :: Int -> Integer -> Integer
firstNDigits n number =
  let shortStr = take n $ show number in read shortStr :: Integer


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
