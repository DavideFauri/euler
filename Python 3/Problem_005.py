# What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?
from euler import lcm


def divisible_by_all(N):
    result = 1
    for n in range(1, N + 1):
        result = lcm(result, n)
    return int(result)


print(divisible_by_all(20))
