# Evaluate the sum of all the amicable numbers under 10000
from euler import divisors


def amicables():
    a = 0
    while True:
        a += 1
        b = sum(divisors(a))
        if b > a:
            a_hat = sum(divisors(b))
            if a == a_hat:
                yield (a, b)


def sum_amicables_under(limit):
    total = 0
    for (a1, a2) in amicables():
        if a2 > limit:
            return total
        total += a1 + a2


if __name__ == "__main__":
    print(sum_amicables_under(10000))
