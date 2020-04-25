# What is the sum of the digits of the number 2^(1000)?


def sum_of_digits(number):
    if number == 0:
        return 0
    return sum_of_digits(number // 10) + number % 10


if __name__ == "__main__":
    print(sum_of_digits(2 ** 1000))
