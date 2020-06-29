-- What is the greatest product of four adjacent numbers in any direction in the 20x20 grid?
import           System.IO
import           Data.Array


type Grid = Array (Int, Int) Int
type Slice = [Int]
type Length = Int


parseGrid :: String -> Grid
parseGrid rawString = listArray ((1, 1), (nrows, ncols)) elements
 where
  nrows       = length rawElements
  ncols       = length . head $ rawElements
  elements    = map read . concat $ rawElements
  rawElements = map words . lines $ rawString


greatestProduct :: Grid -> Length -> Int
greatestProduct grid lenSlice = maximum $ map product allSlices
 where
  allSlices  = concat [ takeSlices grid lenSlice d | d <- directions ]
  directions = [(1, 0), (0, 1), (1, 1), (1, -1)]


takeSlices :: Grid -> Length -> (Int, Int) -> [Slice]
takeSlices grid lenSlice (incr_row, incr_col) = map takeSlice startPoints
 where
  startPoints = indices grid
  takeSlice (r0, c0) =
    [ grid ! (r, c)
    | n <- [0 .. lenSlice - 1]
    , let r = r0 + incr_row * n
    , let c = c0 + incr_col * n
    , inRange (bounds grid) (r, c)
    ]


main :: IO ()
main = do
  withFile
    "../data/data_011.txt"
    ReadMode
    (\h -> do
      fileContents <- hGetContents h
      let grid = parseGrid fileContents
      print $ greatestProduct grid 4
    )
