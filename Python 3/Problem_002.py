# Find the sum of all the even-valued terms in the Fibonacci sequence which do not exceed four million.


def evenFibonacciUnder(limit):
    past = 0
    yield past
    present = 2
    while present < limit:
        yield present
        future = present * 4 + past  #  custom formula for even-only Fibonacci numbers
        past, present = present, future


if __name__ == "__main__":
    print(sum(i for i in evenFibonacciUnder(4000000)))
