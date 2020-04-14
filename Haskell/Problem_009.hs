isPythagoreanTriplet :: (Integer, Integer, Integer) -> Bool
isPythagoreanTriplet (a, b, c) = a ^ 2 + b ^ 2 == c ^ 2


isProperTriangle :: (Integer, Integer, Integer) -> Bool
isProperTriangle (a, b, c) = a < b + c && b < a + c && c < a + b


triangleTripletsWithSum :: Integer -> [(Integer, Integer, Integer)]
triangleTripletsWithSum n =
  filter isPythagoreanTriplet $ filter isProperTriangle $ tripletsWithSum n


tripletsWithSum :: Integer -> [(Integer, Integer, Integer)]
tripletsWithSum n =
  [ (a, b, n - a - b) | a <- [0 .. n `div` 2 + 1], b <- [0 .. n `div` 2] ]


productTriplets :: [(Integer, Integer, Integer)] -> [Integer]
productTriplets xs = map (\(a, b, c) -> a * b * c) xs


main :: IO ()
main = do
  print $ productTriplets $ triangleTripletsWithSum 1000
