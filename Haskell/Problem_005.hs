divisibleByAll :: Integer -> Integer
divisibleByAll N = foldl lcm 1 [1 .. N]


solution = divisibleByAll 20
