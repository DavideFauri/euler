# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.


def long_div(a, b):
    assert a >= 0 and b > 0
    if a == 0:
        return 0

    remainders = set()
    while True:

        quot, rem = divmod(a, b)
        while quot == 0:
            a *= 10
            quot, rem = divmod(a, b)

        if rem == 0:  # division is proper
            return 0

        elif rem in remainders:  # we reached a loop
            return len(remainders)

        else:  # we continue searching
            remainders.add(rem)
            a = rem


def longest_recurring_under(N):
    longest_ix = -1
    longest_length = 0
    for n in range(1, N):
        this_length = long_div(1, n)
        if this_length > longest_length:
            longest_ix, longest_length = n, this_length
    return longest_ix


if __name__ == "__main__":
    print(longest_recurring_under(1000))
