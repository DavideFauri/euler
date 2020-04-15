# What is the greatest product of four adjacent numbers in any direction in the 20x20 grid?
from pathlib import Path


datapath = Path.cwd() / "data/data_011.txt"
with open(datapath, "r") as datafile:
    lines = datafile.readlines()
    text_grid = [line.strip().split(" ") for line in lines]
    assert max(len(row) for row in text_grid) == min(len(row) for row in text_grid)
    GRID = [[int(n) for n in row] for row in text_grid]


def grid_size(grid):
    width = len(grid[0])
    height = len(grid)
    return (width, height)


def search_hor(grid, len_pattern):
    grid_width, grid_height = grid_size(grid)
    max_hor = 0

    for row_ix in range(grid_height):
        for col_ix in range(grid_width - len_pattern):

            productory = 1
            for shift in range(len_pattern):
                productory *= grid[row_ix][col_ix + shift]

            max_hor = max(max_hor, productory)
    return max_hor


def search_ver(grid, len_pattern):
    grid_width, grid_height = grid_size(grid)
    max_ver = 0

    for col_ix in range(grid_width):
        for row_ix in range(grid_height - len_pattern):

            productory = 1
            for shift in range(len_pattern):
                productory *= grid[row_ix + shift][col_ix]

            max_ver = max(max_ver, productory)
    return max_ver


def search_diag_L(grid, len_pattern):
    grid_width, grid_height = grid_size(grid)
    max_diag = 0

    for row_ix in range(grid_height - len_pattern):
        for col_ix in range(grid_width - len_pattern):

            productory = 1
            for shift in range(len_pattern):
                productory *= grid[row_ix + shift][col_ix + shift]

            max_diag = max(max_diag, productory)
    return max_diag


def search_diag_R(grid, len_pattern):
    grid_width, grid_height = grid_size(grid)
    max_diag = 0

    for row_ix in range(len_pattern, grid_height):
        for col_ix in range(grid_width - len_pattern):

            productory = 1
            for shift in range(len_pattern):
                productory *= grid[row_ix - shift][col_ix + shift]

            max_diag = max(max_diag, productory)
    return max_diag


def max_productory(grid, len_pattern):
    return max(
        search_hor(grid, len_pattern),
        search_ver(grid, len_pattern),
        search_diag_L(grid, len_pattern),
        search_diag_R(grid, len_pattern),
    )


print(max_productory(GRID, 4))
