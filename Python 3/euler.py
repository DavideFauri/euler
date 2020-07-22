import itertools as it
from math import ceil, sqrt


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


def is_prime(n):
    if n <= 0:
        return False
    for p in primes():
        if p > sqrt(n):
            break
        if n % p == 0:
            return False
    return True


def factorize(n):
    if n == 1:
        return []
    for p in primes():
        if n % p == 0:
            return [p] + factorize(n / p)


def divisors(n):
    assert n > 0, f"Number {n} is not positive!"
    assert int(n) == n, f"Number {n} is not an integer!"
    div = {1}
    if n in (1, 2):  # special cases
        return div
    for d in range(2, 1 + ceil(sqrt(n))):
        if n % d == 0:
            div.add(d)
            div.add(n // d)
    return div


def fibonacci():
    a = 1
    b = 1
    while True:
        yield a
        a, b = b, a + b


def progress_bar(n, step=10000):
    if n % step == 0:
        print(".", end="", flush=True)
