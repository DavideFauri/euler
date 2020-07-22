-- Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.


inverseWithMaxRecurringUnder :: Integer -> Integer
inverseWithMaxRecurringUnder n =
  snd $ maximum $ zip [ lengthRecurring 1 x | x <- [2 .. n] ] [2 .. n]


lengthRecurring :: Integer -> Integer -> Int
lengthRecurring 0   _   = 0
lengthRecurring num den = _lengthRecurring num den []
 where
  _lengthRecurring num den rs = __lengthRecurring num den rs
   where
    rem = snd $ _divMod num den
    __lengthRecurring num den rs
      | rem == 0      = 0
      | rem `elem` rs = length rs
      | otherwise     = _lengthRecurring rem den (rem : rs)


_divMod :: Integer -> Integer -> (Integer, Integer)
_divMod n d = divModHelper n d
 where
  (q, r) = divMod n d
  divModHelper n d | q == 0    = _divMod (n * 10) d
                   | otherwise = (q, r)


main :: IO ()
main = do
  print $ inverseWithMaxRecurringUnder 1000
