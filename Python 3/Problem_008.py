# Find the greatest product of thirteen consecutive digits in the 1000-digit number
from pathlib import Path


if __name__ == "__main__":
    datapath = Path.cwd() / "data/data_008.txt"
    with open(datapath, "r") as datafile:
        NUMBER = datafile.readline()


def greatest_product_of_length(number_str, length):
    # any streak with a 0 will have product == 0
    candidates = number_str.split("0")
    # drop streaks shorter than the length
    candidates = [c for c in candidates if len(c) >= length]

    largest_product = 0
    for candidate in candidates:
        for shift in range(len(candidate) - length + 1):
            digits = [int(c) for c in candidate[shift : shift + length]]

            this_product = 1
            for digit in digits:
                this_product *= digit
            largest_product = max(largest_product, this_product)

    return largest_product


if __name__ == "__main__":
    print(greatest_product_of_length(NUMBER, 13))
