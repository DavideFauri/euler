-- What is the total of all the name scores in the file?
import           System.IO
import qualified Data.Map.Strict               as Map
import           Data.List                      ( sort )
import           Data.List.Split                ( splitOneOf )


letterPoints :: Map.Map Char Int
letterPoints = Map.fromList $ zip ['A' .. 'Z'] [1 ..]


scoreNames :: [String] -> Int
scoreNames names = sum $ map scoreName namesWithPositions
 where
  namesWithPositions = zip names [1 ..]
  scoreName (name, position) =
    position * sum [ letterPoints Map.! c | c <- name ]


main :: IO ()
main = do
  withFile
    "../data/data_022.txt"
    ReadMode
    (\h -> do
      fileContents <- hGetContents h
      let names = filter (not . null) $ splitOneOf "\",\n" fileContents
      print $ scoreNames $ sort names
    )
