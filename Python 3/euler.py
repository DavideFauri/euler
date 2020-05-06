import itertools as it
from math import floor, sqrt


# least common multiple
def lcm(a, b):
    return abs(a * b) / gcd(a, b)


# greater common divisor
def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a


def primes():
    D = {9: 3, 25: 5}
    yield 2
    yield 3
    yield 5
    MASK = (  # 15 elements because 15 odd numbers in every 30 numbers, with a 1 for every possible candidate, starting from 7 and looping
        1,
        0,
        1,
        1,
        0,
        1,
        1,
        0,
        1,
        0,
        0,
        1,
        1,
        0,
        0,
    )
    MODULOS = frozenset(
        (1, 7, 11, 13, 17, 19, 23, 29)
    )  # because all primes modulo 30 are part of this set

    for q in it.compress(it.islice(it.count(7), 0, None, 2), it.cycle(MASK)):
        p = D.pop(q, None)
        if p is None:
            D[q * q] = q
            yield q
        else:
            x = q + 2 * p
            while x in D or (x % 30) not in MODULOS:
                x += 2 * p
            D[x] = p


def factorize(n):
    if n == 1:
        return []
    for p in primes():
        if n % p == 0:
            return [p] + factorize(n / p)


def divisors(n):
    div = [1]
    for d in range(2, floor(sqrt(n))):
        if n % d == 0:
            div.append(d)
            div.append(n // d)
    return div


def progress_bar(n, step=10000):
    if n % 10000 == 0:
        print(".", end="", flush=True)
