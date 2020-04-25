# Find the maximum total from top to bottom of the triangle
from pathlib import Path


if __name__ == "__main__":
    datapath = Path.cwd() / "data/data_018.txt"
    with open(datapath, "r") as datafile:
        TRIANGLE = []
        for line in datafile.readlines():
            TRIANGLE.append([int(s) for s in line.split()])


def reduce_upwards(bottom_row, top_row):
    assert len(bottom_row) == len(top_row) + 1
    for ix, value in enumerate(top_row):
        top_row[ix] = value + max(bottom_row[ix], bottom_row[ix + 1])
    return top_row


def reduce_triangle(triangle):
    bottomup = range(len(triangle) - 1, 0, -1)
    for i in bottomup:
        triangle[i - 1] = reduce_upwards(triangle[i], triangle[i - 1])
    return triangle[0][0]


if __name__ == "__main__":
    print(reduce_triangle(TRIANGLE))
