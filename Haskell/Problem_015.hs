-- How many routes are there through a 20x20 grid?
import           System.IO
import           Data.MemoTrie


numRoutes :: ((Integer, Integer) -> Integer) -> (Integer, Integer) -> Integer
numRoutes nr (width, 1     ) = width + 1
numRoutes nr (1    , height) = height + 1
numRoutes nr (width, height) =
  1 + sum [ nr (w, height - 1) | w <- [1 .. width] ]


memoizedNumRoutes :: (Integer, Integer) -> Integer
memoizedNumRoutes = memoFix numRoutes


main :: IO ()
main = do
  print $ memoizedNumRoutes (20, 20)
