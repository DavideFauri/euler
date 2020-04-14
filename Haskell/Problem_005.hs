divisibleByAll :: Integer -> Integer
divisibleByAll n = foldl lcm 1 [1 .. n]


main :: IO ()
main = do
  print $ divisibleByAll 20
