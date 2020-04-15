-- What is the greatest product of four adjacent lenSliceumbers in the same direction?
import           System.IO
import           Data.List                      ( transpose )


parseGrid :: String -> [[Int]]
parseGrid rawString = map toListOfNumbers $ lines rawString
  where toListOfNumbers line = [ read word :: Int | word <- words line ]


greatestProduct :: [[Int]] -> Int -> Int
greatestProduct grid lenSlice = maximum $ concat
  [ horizProducts grid lenSlice
  , vertProducts grid lenSlice
  , diagLProducts grid lenSlice
  , diagRProducts grid lenSlice
  ]


horizProducts :: [[Int]] -> Int -> [Int]
horizProducts grid lenSlice =
  let takeSlices lenSlice row =
          [ take lenSlice $ drop shift row
          | shift <- [0 .. (length row - lenSlice)]
          ]
      rowProducts row = [ product slice | slice <- takeSlices lenSlice row ]
  in  concat [ rowProducts row | row <- grid ]


vertProducts :: [[Int]] -> Int -> [Int]
vertProducts grid lenSlice = horizProducts transposedGrid lenSlice
  where transposedGrid = transpose grid


diagLProducts :: [[Int]] -> Int -> [Int]
diagLProducts grid lenSlice =
  let pointAt (row, column) = grid !! row !! column
      takeSlice lenSlice (r, c) =
          [ pointAt (r + shift, c + shift) | shift <- [0 .. lenSlice - 1] ]
      takeSlices =
          [ takeSlice lenSlice (r, c)
          | r <- [0 .. length grid - lenSlice]
          , c <- [0 .. length (grid !! r) - lenSlice]
          ]
  in  [ product slice | slice <- takeSlices ]


diagRProducts :: [[Int]] -> Int -> [Int]
diagRProducts grid lenSlice = diagLProducts flippedGrid lenSlice
  where flippedGrid = map reverse grid


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
