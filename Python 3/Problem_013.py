# Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
from pathlib import Path


if __name__ == "__main__":
    datapath = Path.cwd() / "data/data_013.txt"
    with open(datapath, "r") as datafile:
        NUMBERS = [int(line) for line in datafile.readlines()]


def first_N_digits(number, N):
    str_number = str(number)
    return str_number[0 : min(N, len(str_number))]


if __name__ == "__main__":
    print(first_N_digits(sum(NUMBERS), 10))
