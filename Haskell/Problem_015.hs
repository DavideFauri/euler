-- How many routes are there through a 20x20 grid?
import           System.IO
import           Data.MemoTrie
import qualified Data.Map.Strict               as M
import           Data.List                      ( foldl' )


type Point = (Integer, Integer)


numRoutes :: (Point -> Integer) -> Point -> Integer
numRoutes nr (width, 1     ) = width + 1
numRoutes nr (1    , height) = height + 1
numRoutes nr (width, height) =
  1 + sum [ nr (w, height - 1) | w <- [1 .. width] ]


memoizedNumRoutes :: Point -> Integer
memoizedNumRoutes = memoFix numRoutes


-- *** *** Solve with strict map instead of implicit memoization *** ***


type Grid = M.Map Point Integer


initializedGrid :: Point -> Grid
initializedGrid (xSize, ySize) =
  M.fromList [ ((x, y), 1) | x <- [0 .. xSize], y <- [0 .. ySize] ] --  use also "ghost" 0-row and 0-column for compatibility with filledgrid (1,1)


updateGrid :: Grid -> Point -> Grid
updateGrid grid point@(x, y) = M.insert point nRoutesToPoint grid
 where
  nRoutesToPoint = nRoutesToLeft + nRoutesToUp -- (0,0) is in upper left corner
  nRoutesToLeft  = grid M.! (x - 1, y)
  nRoutesToUp    = grid M.! (x, y - 1)


filledGrid :: Point -> Grid
filledGrid size@(xSize, ySize) = foldl'
  updateGrid
  (initializedGrid size)
  [ (i, j) | j <- [1 .. ySize], i <- [1 .. xSize] ]


numRoutes' :: Point -> Integer
numRoutes' p = filledGrid p M.! p


main :: IO ()
main = do
  print $ memoizedNumRoutes (20, 20)
  print $ numRoutes' (20, 20)
