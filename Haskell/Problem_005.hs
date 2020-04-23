-- What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?


divisibleByAll :: Integer -> Integer
divisibleByAll n = foldr1 lcm [1 .. n]


main :: IO ()
main = do
  print $ divisibleByAll 20
