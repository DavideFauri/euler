-- Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
import           Euler                          ( primes
                                                , isPrime
                                                )
import           Data.List                      ( foldl' )


type Coeff = Int
type Result = Int


-- b is a prime, lower than the imposed limit
generateCoeffB :: Int -> [Coeff]
generateCoeffB limit = takeWhile (<= limit) primes

-- a is negative, odd, and bound by a value
generateCoeffA :: Coeff -> Result -> [Coeff]
generateCoeffA b currentMax = [-boundA, -boundA + 2 .. 0]
  where boundA = currentMax + b `div` currentMax


computeBest :: (Result, (Coeff, Coeff)) -> Coeff -> (Result, (Coeff, Coeff))
computeBest currentMax@(maxNPrimes, (maxA, maxB)) b
  | thisMax > currentMax = thisMax
  | otherwise            = currentMax
 where
  thisMax = maximum
    [ (howManyPrimes a b, (a, b)) | a <- generateCoeffA b (fst currentMax) ]


howManyPrimes :: Coeff -> Coeff -> Result
howManyPrimes a b = length $ takeWhile (isPrime . equation) [0 ..]
  where equation n = n ^ 2 + a * n + b


productCoefficientsMaxPrimes' :: Int -> Int
productCoefficientsMaxPrimes' limit =
  uncurry (*) . snd $ foldl' computeBest (41, (1, 40)) $ generateCoeffB limit


main :: IO ()
main = do
  print $ productCoefficientsMaxPrimes' 1000
