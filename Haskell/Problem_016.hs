-- What is the sum of the digits of the number 2^(1000)?


sumOfDigits :: Integer -> Integer
sumOfDigits 0 = 0
sumOfDigits n = (n `mod` 10) + sumOfDigits (n `div` 10)


main :: IO ()
main = do
  print $ sumOfDigits (2 ^ 1000)
