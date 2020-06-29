-- Find the maximum total from top to bottom of the triangle
import           System.IO
import           Data.List                      ( foldl1' )


type Row = [Int]


readTriangleRow :: String -> Row
readTriangleRow = map read . words


reduceUpwards :: Row -> Row -> Row
reduceUpwards bottomR topR = updatedTopR
 where
  updatedTopR        = zipWith (+) topR pairwiseMaxBottomR
  pairwiseMaxBottomR = zipWith max bottomR (tail bottomR)


reduceTriangle :: [Row] -> Row
reduceTriangle = foldl1' reduceUpwards . reverse


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

