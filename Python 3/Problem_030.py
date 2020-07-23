# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.


POWERS = {
    0: 0,
    1: 1,
    2: 2 ** 5,
    3: 3 ** 5,
    4: 4 ** 5,
    5: 5 ** 5,
    6: 6 ** 5,
    7: 7 ** 5,
    8: 8 ** 5,
    9: 9 ** 5,
}


def is_sum(n):
    acc = 0
    original_n = n

    while n:
        n, last_digit = divmod(n, 10)
        acc += POWERS[last_digit]

    if acc == original_n:
        return True
    else:
        return False


# Using powers of 10 because 999999 gives 354294: it's the first number with all 9s, which is also larger than the sum of the powers of the digits
def sum_numbers_sum_Nth_power(N):
    return sum([n for n in range(2, 10 ** (N + 1)) if is_sum(n)])


if __name__ == "__main__":
    print(sum_numbers_sum_Nth_power(5))
