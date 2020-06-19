-- What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
import           System.IO
import           Euler                          ( factorial )
import           Data.List                      ( delete )


nthPermutation :: Integer -> [Integer] -> String
nthPermutation n elements = concat $ strPermutation
  where strPermutation = [ show el | el <- nthPermutation' (n - 1) elements ]


nthPermutation' :: Integer -> [Integer] -> [Integer]
nthPermutation' 0 el = el
nthPermutation' _ [] = []
nthPermutation' n elements =
  rootSubtree : nthPermutation' nSubtree elementsSubtree
 where
  sizeOfSubtrees = factorial $ (toInteger $ length elements) - 1
  rootSubtree    = elements !! (fromInteger ixRootSubtree)
    where ixRootSubtree = n `quot` sizeOfSubtrees
  nSubtree        = n `rem` sizeOfSubtrees
  elementsSubtree = delete rootSubtree elements


main :: IO ()
main = do
  print $ nthPermutation 1000000 [0 .. 9]
