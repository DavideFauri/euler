-- Find the sum of the digits in the number 100!
import           Euler                          ( factorial )
import           Data.Char                      ( digitToInt )


sumOfDigits :: Integer -> Integer
sumOfDigits = sum . map (toInteger . digitToInt) . show


main :: IO ()
main = do
  print . sumOfDigits . factorial $ 100
