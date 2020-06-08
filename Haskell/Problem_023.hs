{-# LANGUAGE BangPatterns #-}
-- Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
import           System.IO
import           Euler                          ( divisors )
import qualified Data.Set                      as Set -- for faster lookups


upperBoundSum2Abundants :: Integer
upperBoundSum2Abundants = 28123


abundants :: [Integer]
abundants = [ n | n <- [1 ..], (sum . divisors $ n) > n ]


abundantAddends :: Set.Set Integer
abundantAddends =
  Set.fromList $ takeWhile (< upperBoundSum2Abundants) abundants


sumNonSum2Abundants :: Integer
sumNonSum2Abundants = sum nonSum2Abundants
 where
  nonSum2Abundants =
    filter (not . isSumAbundants) [1 .. upperBoundSum2Abundants]
  isSumAbundants n =
    any (\ab -> (n - ab) `Set.member` abundantAddends) abundantAddends


main :: IO ()
main = do
  print $ sumNonSum2Abundants
