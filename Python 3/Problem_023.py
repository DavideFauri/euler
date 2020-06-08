# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
from euler import divisors
from itertools import takewhile

UPPER_BOUND_SUM_TWO_ABUNDANTS = 28124


def abundants():
    n = 1
    while True:
        if sum(divisors(n)) > n:
            yield n
        n += 1


ABUNDANT_ADDENDS = set(
    takewhile(
        lambda ab: ab < UPPER_BOUND_SUM_TWO_ABUNDANTS,
        (abundant for abundant in abundants()),
    )
)


def not_sum_2_abundants():
    for n in range(1, UPPER_BOUND_SUM_TWO_ABUNDANTS):
        if not any(n - ab in ABUNDANT_ADDENDS for ab in ABUNDANT_ADDENDS):
            yield n


if __name__ == "__main__":
    print(sum(i for i in not_sum_2_abundants()))
