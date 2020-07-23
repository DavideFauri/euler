-- Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
import qualified Data.Map.Strict               as M
import qualified Data.Set                      as S
import           Data.Char                      ( digitToInt )



powers :: M.Map Char Integer
powers =
  M.fromSet (\c -> toInteger $ digitToInt c ^ 5) (S.fromList "0123456789")


isSum :: Integer -> Bool
isSum n = n == sum (map (powers M.!) (show n))


sumNumbersSumNthPower :: Int -> Integer
sumNumbersSumNthPower n = sum . filter isSum $ [2 .. 10 ^ (n + 1)]


main :: IO ()
main = do
  print $ sumNumbersSumNthPower 5
