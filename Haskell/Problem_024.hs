-- What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
import           Euler                          ( factorial )
import           Data.List                      ( permutations
                                                , sort
                                                )
import           Data.SortedList                ( SortedList
                                                , toSortedList
                                                , fromSortedList
                                                , delete
                                                )


-- more complicated, but O(k) for k = #elements
nthPermutation :: Int -> [Integer] -> Integer
nthPermutation n elements =
  read . concatMap show . nthPermutation' (n - 1) $ toSortedList elements


-- use type SortedList to guarantee that input list is ascending
nthPermutation' :: (Eq a, Ord a) => Int -> SortedList a -> [a]
nthPermutation' 0 el = fromSortedList el
nthPermutation' n elements
  | elements == toSortedList [] = []
  | otherwise = rootSubtree : nthPermutation' nSubtree elementsSubtree
 where
  sizeOfSubtrees  = factorial (length elements - 1)
  rootSubtree     = fromSortedList elements !! (n `quot` sizeOfSubtrees)
  nSubtree        = n `rem` sizeOfSubtrees
  elementsSubtree = delete rootSubtree elements


-- simpler, but soooo much slower
nthPermutation'' :: Int -> String -> String
nthPermutation'' n digits = (sort . permutations $ digits) !! (n - 1)


main :: IO ()
main = do
  print $ nthPermutation 1000000 [0 .. 9]
  print $ nthPermutation'' 1000000 "0123456789"
