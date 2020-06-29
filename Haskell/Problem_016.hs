-- What is the sum of the digits of the number 2^(1000)?


sumOfDigits :: Integer -> Integer
sumOfDigits = sum . map (toInteger . read . pure) . show -- pure lifts a Char to a [Char], so read can work


main :: IO ()
main = do
  print $ sumOfDigits (2 ^ 1000)
