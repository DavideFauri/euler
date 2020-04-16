import           System.IO


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
      let largeNumbers = [ read line :: Integer | line <- lines fileContents ]
      print $ firstNDigits 10 $ sum largeNumbers
    )
