# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.


def difference(N):
    return abs(sum_of_squares(N) - square_of_sum(N))


def sum_of_squares(N):
    return sum((i + 1) ** 2 for i in range(N))


def square_of_sum(N):
    return ((N + 1) * N / 2) ** 2


print(difference(100))
