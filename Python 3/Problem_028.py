# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral?


def four_corners(n):
    return (n ** 2) * 4 - (n - 1) * 6


def sum_diagonals_spiral(side):
    diagonals = 1
    for i in range(3, side + 1, 2):
        diagonals += four_corners(i)
    return diagonals


if __name__ == "__main__":
    print(sum_diagonals_spiral(1001))
