# Find the sum of all the primes below two million
from euler import primes


def sumPrimesBelow(N):
    acc = 0
    for p in primes():
        if p >= N:
            return acc
        acc += p


print(sumPrimesBelow(2000000))
