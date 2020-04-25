# Find the sum of the digits in the number 100!
from Problem_016 import sum_of_digits


def factorial(n):
    if n == 1:
        return 1
    return n * factorial(n - 1)


if __name__ == "__main__":
    print(sum_of_digits(factorial(100)))
