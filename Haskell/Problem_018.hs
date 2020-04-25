-- Find the maximum total from top to bottom of the triangle
import           System.IO
import           Data.List                      ( foldl1' )


readTriangleRow :: String -> [Int]
readTriangleRow line = map read $ words line


reduceUpwards :: [Int] -> [Int] -> [Int]
reduceUpwards downRow topRow = updatedTopRow where
  updatedTopRow = map collapseUp [0 .. (length topRow) - 1]
  collapseUp ix = (topRow !! ix) + max (downRow !! ix) (downRow !! (ix + 1))


reduceTriangle :: [[Int]] -> [Int]
reduceTriangle t = foldl1' reduceUpwards $ reverse t


main :: IO ()
main = do
  withFile
    "../data/data_018.txt"
    ReadMode
    (\h -> do
      fileContents <- hGetContents h
      let triangle = map readTriangleRow $ lines fileContents
      print $ reduceTriangle triangle
    )

