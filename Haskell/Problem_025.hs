-- What is the first term in the Fibonacci sequence to contain 1000 digits?
import           System.IO
import           Euler                          ( fibonacci )


firstFibNDigits :: Integer -> Integer
firstFibNDigits n = fst . head . dropWhile checkDigits $ zip [0 ..] fibonacci
  where checkDigits = (< 10 ^ (n - 1)) . snd


main :: IO ()
main = do
  print $ firstFibNDigits 1000
