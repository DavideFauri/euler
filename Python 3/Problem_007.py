# What is the 10001st prime number?
from euler import primes


def nth_prime(n):
    for i, prime in enumerate(p for p in primes()):
        if i + 1 == n:
            return prime


if __name__ == "__main__":
    print(nth_prime(10001))
