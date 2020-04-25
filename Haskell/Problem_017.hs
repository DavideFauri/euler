-- If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
import qualified Data.Map.Strict               as Map


wordMap :: Map.Map Int String
wordMap = Map.fromList
  [ (0     , "zero")
  , (1     , "one")
  , (2     , "two")
  , (3     , "three")
  , (4     , "four")
  , (5     , "five")
  , (6     , "six")
  , (7     , "seven")
  , (8     , "eight")
  , (9     , "nine")
  , (10    , "ten")
  , (11    , "eleven")
  , (12    , "twelve")
  , (13    , "thirteen")
  , (14    , "fourteen")
  , (15    , "fifteen")
  , (16    , "sixteen")
  , (17    , "seventeen")
  , (18    , "eighteen")
  , (19    , "nineteen")
  , (20    , "twenty")
  , (30    , "thirty")
  , (40    , "forty")
  , (50    , "fifty")
  , (60    , "sixty")
  , (70    , "seventy")
  , (80    , "eighty")
  , (90    , "ninety")
  , (100   , "hundred")
  , (1000  , "thousand")
  , (10 ^ 6, "million")
  , (10 ^ 9, "billion")
  ]


num2strBelow10e2 :: Int -> String
num2strBelow10e2 0 = ""
num2strBelow10e2 n = case Map.lookup n wordMap of
  Just str -> str
  Nothing  -> num2strBelow10e2 tens ++ num2strBelow10e2 units   where
    units = n `mod` 10
    tens  = n - units


num2strBelow10e3 :: Int -> String
num2strBelow10e3 n = str_hundreds ++ conjunction ++ str_remainder where
  str_hundreds =
    if hundreds > 0 then (wordMap Map.! hundreds) ++ (wordMap Map.! 100) else ""
  conjunction = if hundreds > 0 && remainder > 0 then "and" else ""
  str_remainder = if remainder > 0 then num2strBelow10e2 remainder else ""
  (hundreds, remainder) = n `divMod` (10 ^ 2)


num2strBelow10e6 :: Int -> String
num2strBelow10e6 n = str_thousands ++ str_remainder where
  str_thousands = if thousands > 0
    then (num2strBelow10e3 thousands) ++ (wordMap Map.! (10 ^ 3))
    else ""
  str_remainder = if remainder > 0 then num2strBelow10e3 remainder else ""
  (thousands, remainder) = n `divMod` (10 ^ 3)


num2strBelow10e9 :: Int -> String
num2strBelow10e9 n = str_millions ++ str_remainder where
  str_millions = if millions > 0
    then (num2strBelow10e3 millions) ++ (wordMap Map.! (10 ^ 6))
    else ""
  str_remainder = if remainder > 0 then num2strBelow10e6 remainder else ""
  (millions, remainder) = n `divMod` (10 ^ 6)


num2str :: Int -> String
num2str = num2strBelow10e9


countLettersRange :: [Int] -> Int
countLettersRange []   = 0
countLettersRange list = sum $ map (length . num2str) list


main :: IO ()
main = do
--   print $ map num2str [100 .. 121]
  print $ countLettersRange [1 .. 1000]
