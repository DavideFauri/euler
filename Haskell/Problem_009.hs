-- There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc.
import           Data.SBV -- SMT (Satisfiability Modulo Theories) Based Verification solver (default solver is Z3, is additional dependency)


isPythagoreanTriplet :: (Integer, Integer, Integer) -> Bool
isPythagoreanTriplet (a, b, c) = a ^ 2 + b ^ 2 == c ^ 2


isProperTriangle :: (Integer, Integer, Integer) -> Bool
isProperTriangle (a, b, c) = a < b + c && b < a + c && c < a + b


triangleTripletsWithSum :: Integer -> [(Integer, Integer, Integer)]
triangleTripletsWithSum n =
  filter isPythagoreanTriplet $ filter isProperTriangle $ tripletsWithSum n


tripletsWithSum :: Integer -> [(Integer, Integer, Integer)]
tripletsWithSum n =
  [ (a, b, c)
  | a <- [0 .. n `div` 2 + 1]
  , b <- [0 .. n `div` 2]
  , let c = n - a - b
  ]


productTriplets :: [(Integer, Integer, Integer)] -> [Integer]
productTriplets = map (\(a, b, c) -> a * b * c)


main :: IO ()
main = do
  print . head . productTriplets . triangleTripletsWithSum $ 1000

  sbvSolution <- solution 1000
  case
      ( getModelValue "a" sbvSolution :: Maybe Integer
      , getModelValue "b" sbvSolution :: Maybe Integer
      , getModelValue "c" sbvSolution :: Maybe Integer
      )
    of -- maybe since the solver might not find a solution
      (Just a, Just b, Just c) -> print $ a * b * c
      _                        -> putStrLn "Whoops, no solution here"


solution sumTriplet = sat $ do
  a <- sInteger "a" -- symbolic integer
  b <- sInteger "b" -- symbolic integer
  c <- sInteger "c" -- symbolic integer
  constrain $ 0 .< a .&& a .<= b .&& b .<= c -- symbolic operators are prepended with a dot
  constrain $ a * a + b * b .== c * c -- sbv library provides implementation of Num class for symbolic, so some numerical operators do not need plus
  constrain $ a + b + c .== sumTriplet
