-- What is the total of all the name scores in the file?
import           System.IO
import qualified Data.Map.Strict               as Map
import           Data.List                      ( sort )
import           Data.List.Split                ( splitOneOf )


letterToPoints :: Map.Map Char Int
letterToPoints = Map.fromList $ zip ['A' .. 'Z'] [1 ..]


scoreNames :: [String] -> Int
scoreNames = sum . zipWith scoreName [1 ..]
 where
  scoreName index name =
    index * sum [ letterToPoints Map.! letter | letter <- name ]


main :: IO ()
main = do
  withFile
    "../data/data_022.txt"
    ReadMode
    (\h -> do
      fileContents <- hGetContents h
      let names = filter (not . null) $ splitOneOf "\",\n" fileContents
      print . scoreNames . sort $ names
    )
