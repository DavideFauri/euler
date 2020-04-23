-- What is the greatest product of four adjacent numbers in any direction in the 20x20 grid?
import           System.IO
import           Data.Array


parseGrid :: String -> Array (Int, Int) Int
parseGrid rawString = listArray ((1, 1), (nrows, ncols)) elements
 where
  elements    = map read $ concat rawElements
  rawElements = map words $ lines rawString
  nrows       = length rawElements
  ncols       = length $ head rawElements


greatestProduct :: Array (Int, Int) Int -> Int -> Int
greatestProduct grid lenSlice = maximum $ map product allSlices
 where
  allSlices = concat $ map takeSlicesInDirection directions
  takeSlicesInDirection d = takeSlices grid d lenSlice
  directions = [(1, 0), (0, 1), (1, 1), (1, -1)]


takeSlices :: Array (Int, Int) Int -> (Int, Int) -> Int -> [[Int]]
takeSlices grid (incr_row, incr_col) lenSlice = slices where
  slices      = map takeSlice startPoints
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
