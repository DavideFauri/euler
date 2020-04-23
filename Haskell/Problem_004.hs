-- Find the largest palindrome made from the product of two 3-digit numbers.


largestPalindrome :: Integer -> Integer
largestPalindrome n =
  head
    $  filter (testIfFactorsHaveLength n)
    $  (generatePalindromesOfLength $ 2 * n)
    ++ (generatePalindromesOfLength $ 2 * n - 1)


testIfFactorsHaveLength :: Integer -> Integer -> Bool
testIfFactorsHaveLength length number = any (`hasLength` length)
  $ map (number `div`) possibleDivisors
 where
  n `hasLength` l = 10 ^ (l - 1) <= abs n && abs n < 10 ^ l
  possibleDivisors =
    [ divisor | divisor <- (numbersOfLength length), number `mod` divisor == 0 ]


numbersOfLength :: Integer -> [Integer]
numbersOfLength digits = [maxNumber, maxNumber - 1 .. minNumber]
 where
  maxNumber = toInteger (10 ^ digits) - 1
  minNumber = 10 ^ (fromIntegral digits - 1)


generatePalindromesOfLength :: Integer -> [Integer]
generatePalindromesOfLength length
  | even length = map palyndromizeEven $ bases (length `div` 2)
  | otherwise   = map palyndromizeOdd $ bases (length `div` 2 + 1)
 where
  palyndromizeEven n = read $ (show n) ++ (reverse $ show n)
  palyndromizeOdd n = read $ (show n) ++ (tail $ reverse $ show n)
  bases digits = [maxBase, maxBase - 1 .. minBase] -- 999 ... 100
   where
    maxBase = 10 ^ digits - 1
    minBase = 10 ^ (digits - 1)


main :: IO ()
main = do
  print $ largestPalindrome 3
