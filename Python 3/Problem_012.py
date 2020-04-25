# What is the value of the first triangle number to have over five hundred divisors?
from euler import factorize


def triangle_numbers():
    t = 0
    i = 1
    while True:
        t += i
        i += 1
        yield t


def n_divisors(n):
    prime_factors = factorize(n)
    counts = [prime_factors.count(p) for p in set(prime_factors)]
    n_divisors = 1
    for c in counts:
        n_divisors *= c + 1
    return n_divisors


def triangle_with_n_divisors(limit):
    for t in triangle_numbers():
        if n_divisors(t) > limit:
            return t


if __name__ == "__main__":
    print(triangle_with_n_divisors(500))
