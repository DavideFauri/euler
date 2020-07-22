# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
from euler import primes, is_prime

# n^2 + a*n + b  for n = [0..]

# b must be prime to give a prime solution for n=0
# b should be more than the known Euler's solution
# a should be odd to give an odd solution for n=1 (b is always odd, it's a prime)
# a should be negative for twice the results (if n=x gives a prime, also n=|a|-x gives a prime)
#     if a == -A with A>=0, then:
#     n = x ==> x^2 - Ax + b
#     n = A-x ==> (A-x)^2 - A(A-x) + b == A^2 + x^2 - 2Ax - A^2 + Ax + b == x^2 - Ax + b
# a should start at negative (m + b div m), because

# all primes must be positive so for any n=M we have M^2-AM+b > 0 which means A > M + floor(b/M)


def coefficientsMaxPrimes(coeff_limit):
    max_n_primes = 40  # known result from Euler
    max_a = 1  # known result from Euler
    max_b = 41  # known result from Euler

    for b in primes():
        if b <= 41:
            continue  # Euler's result is better
        if b > coeff_limit:
            break

        # to generate at least `max_n_primes` primes, a should start from here
        start = -(max_n_primes + b // max_n_primes)

        # a should be odd
        if start % 2 == 0:
            start -= 1

        for a in range(start, 0, 2):
            n_primes = 0

            while is_prime(n_primes ** 2 + a * n_primes + b):
                n_primes += 1

            if n_primes > max_n_primes:
                max_n_primes = n_primes
                max_a = a
                max_b = b
    return max_a, max_b


def productCoefficientsMaxPrimes(coeff_limit):
    a, b = coefficientsMaxPrimes(coeff_limit)
    return a * b


if __name__ == "__main__":
    print(productCoefficientsMaxPrimes(1000))
