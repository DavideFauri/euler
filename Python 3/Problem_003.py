# Find the largest prime factor of a composite number.
from math import sqrt, floor
from euler import primes


def max_factor(N):
    max_factor = None
    limit = floor(sqrt(N))

    for p in primes():
        if N % p == 0:
            max_factor = p
        if p > limit:
            return max_factor


print(max_factor(600851475143))
