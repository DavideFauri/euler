# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
from math import factorial


def Nth_permutation(N, elements):
    assert N < factorial(len(elements))

    return "".join(str(x) for x in _Nth_permutation(N - 1, sorted(elements)))


def _Nth_permutation(N, elements):
    if not elements:
        return []

    size_of_subtrees = factorial(len(elements) - 1)
    root_subtree, N_subtree = divmod(N, size_of_subtrees)
    this_element = elements.pop(root_subtree)

    return [this_element] + _Nth_permutation(N_subtree, elements)


if __name__ == "__main__":
    print(Nth_permutation(1000000, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]))
