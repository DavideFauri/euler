-- How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
import           System.IO
import           Data.List                      ( foldl' )


data DayOfWeek = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday deriving (Eq, Ord, Enum, Show)
data Month = Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec deriving (Eq, Ord, Enum, Show)
type Year = Int


year :: [(Month, Int)]
year = zip [Jan .. Dec] [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]


leapYear :: [(Month, Int)]
leapYear = (take 1 year) ++ [(Feb, 29)] ++ (drop 2 year)


isLeap :: Year -> Bool
isLeap y | y `mod` 400 == 0 = True
         | y `mod` 100 == 0 = False
         | y `mod` 4 == 0   = True
         | otherwise        = False


monthsOfYear :: Year -> [(Month, Int)]
monthsOfYear y | isLeap y  = leapYear
               | otherwise = year


week :: [DayOfWeek]
week = [Sunday .. Saturday]


advanceTime :: DayOfWeek -> Int -> DayOfWeek
advanceTime today n_days = head $ drop n_days future
 where
  future     = restOfWeek ++ (cycle week)
  restOfWeek = dropWhile (today /=) week


epochTime :: (Year, DayOfWeek)
epochTime = (1900, Monday)
epochYear :: Year
epochYear = fst epochTime
epochDOW :: DayOfWeek
epochDOW = snd epochTime


countDays :: DayOfWeek -> Year -> Year -> Maybe Int
countDays day startY endY | startY < epochYear = Nothing
                          | startY > endY      = Nothing
                          | otherwise          = Just nDays
 where
  nDays       = length $ filter (== day) daysInRange
  daysInRange = scanl advanceAMonth dayAtStartOfRange monthsInRange   where
    advanceAMonth d m = advanceTime d (snd m)
    monthsInRange = concat $ map monthsOfYear [startY .. endY]
  dayAtStartOfRange = foldl' advanceAYear epochDOW gapToStart   where
    gapToStart = [epochYear .. startY - 1]
    advanceAYear d y = advanceTime d $ daysInYear y
    daysInYear y = sum [ snd m | m <- monthsOfYear y ]


main :: IO ()
main = do
  print $ countDays Sunday 1901 2000
