# There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product abc.


def is_Pyt_triplet(a, b, c):
    return a ** 2 + b ** 2 == c ** 2


def is_triangle(a, b, c):
    return a < b + c and b < a + c and c < a + b


def find_triplets_with_sum(N):
    for b in range(N // 2 + 1):
        for c in range(N // 2):
            a = 1000 - b - c
            if is_triangle(a, b, c) and is_Pyt_triplet(a, b, c):
                yield (a, b, c)


print([a * b * c for (a, b, c) in find_triplets_with_sum(1000)])
