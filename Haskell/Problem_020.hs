-- Find the sum of the digits in the number 100!
import Euler (factorial)


sumOfDigits :: Integer -> Integer
sumOfDigits 0 = 0
sumOfDigits n = (n `mod` 10) + sumOfDigits (n `div` 10)


main :: IO ()
main = do
  print . sumOfDigits . factorial $ 100
