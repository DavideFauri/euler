# What is the first term in the Fibonacci sequence to contain 1000 digits?
from euler import fibonacci


def first_Fib_N_digits(N):
    for i, f in enumerate(fibonacci()):
        if f >= 10 ** (N - 1):
            return i + 1


if __name__ == "__main__":
    print(first_Fib_N_digits(1000))
