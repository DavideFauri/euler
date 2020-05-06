# What is the total of all the name scores in the file?
from pathlib import Path


if __name__ == "__main__":
    datapath = Path.cwd() / "data/data_022.txt"
    with open(datapath, "r") as datafile:
        NAMES = datafile.readline().replace('"', "").split(",")


LETTERS = {
    "A": 1,
    "B": 2,
    "C": 3,
    "D": 4,
    "E": 5,
    "F": 6,
    "G": 7,
    "H": 8,
    "I": 9,
    "J": 10,
    "K": 11,
    "L": 12,
    "M": 13,
    "N": 14,
    "O": 15,
    "P": 16,
    "Q": 17,
    "R": 18,
    "S": 19,
    "T": 20,
    "U": 21,
    "V": 22,
    "W": 23,
    "X": 24,
    "Y": 25,
    "Z": 26,
}


def score_name(name, position=1):
    return position * sum(LETTERS[c] for c in name.upper())


def score_names(names):
    return sum(score_name(name, position=i + 1) for i, name in enumerate(names))


if __name__ == "__main__":
    print(score_names(sorted(NAMES)))
