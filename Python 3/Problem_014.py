# Which starting number, under one million, produces the longest Collatz chain?
from euler import progress_bar


Collatz_lengths = {1: 1}


def len_Collatz(n):
    if n in Collatz_lengths:
        return Collatz_lengths[n]

    if n % 2 == 0:
        return 1 + len_Collatz(n // 2)
    else:
        return 1 + len_Collatz(3 * n + 1)


def longest_Collatz_under(limit):
    for n in range(2, limit):
        Collatz_lengths[n] = len_Collatz(n)
        progress_bar(n)
    print()

    longest_Collatz = (0, 0)
    for k, v in Collatz_lengths.items():
        if Collatz_lengths[k] > longest_Collatz[1]:
            longest_Collatz = (k, v)

    return longest_Collatz[0]


print(longest_Collatz_under(1000000))
