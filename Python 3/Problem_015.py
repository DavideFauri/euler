# How many routes are there through a 20x20 grid?


paths = {}


def routes(width, height):
    if height == 1 or width == 1:
        return height + width

    A = min(width, height)
    B = max(width, height)

    if (A, B) not in paths:
        n_paths = 1 + sum(routes(w, height - 1) for w in range(1, width + 1))
        paths[(A, B)] = n_paths

    return paths[(A, B)]


if __name__ == "__main__":
    print(routes(20, 20))


# routes(4,4) => 70
#     routes(1,3) -> 4
#     routes(2,3) => 10 (+ MEMOIZED)
#         routes(1,2) -> 3
#         routes(2,2) => 6 (+ MEMOIZED)
#             routes(1,1) -> 2
#             routes(2,1) -> 3
#     routes(3,3) => 20 (+ MEMOIZED)
#         routes(1,2) -> 3
#         routes(2,2) => 6 (FROM MEMOIZED)
#         routes(3,2) => 10 (FROM MEMOIZED)
#     routes(4,3) => 35 (+ MEMOIZED)
#         routes(1,2) -> 3
#         routes(2,2) => 6
#         routes(3,2) => 10 (FROM MEMOIZED)
#         routes(4,2) => 15 (+ MEMOIZED)
#             routes(1,1) -> 2
#             routes(2,1) -> 3
#             routes(3,1) -> 4
#             routes(4,1) -> 5
