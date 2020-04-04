# Add all the natural numbers below one thousand that are multiples of 3 or 5.
from euler import lcm


def sum_of_multiples_under(base, limit):
    ceiling = (limit - 1) // base
    return ceiling * (ceiling + 1) / 2 * base


def fizzbuzz(a, b, limit):
    return (
        sum_of_multiples_under(a, limit)
        + sum_of_multiples_under(b, limit)
        - sum_of_multiples_under(lcm(a, b), limit)
    )


print(fizzbuzz(3, 5, 1000))
