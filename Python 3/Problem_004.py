# Find the largest palindrome made from the product of two 3-digit numbers.
from math import ceil


def largest_palyndrome(divisorDigits):
    even_palyndromes = _generate_palyndromes(2 * divisorDigits)
    for palyndrome in even_palyndromes:
        if _both_divisors_have_n_digits(palyndrome, divisorDigits):
            return palyndrome

    odd_palyndromes = _generate_palyndromes(2 * divisorDigits - 1)
    for palyndrome in odd_palyndromes:
        if _both_divisors_have_n_digits(palyndrome, divisorDigits):
            return palyndrome


def _generate_palyndromes(palyndrome_digits):
    even_palyndromes = palyndrome_digits % 2 == 0

    half_digits = ceil(palyndrome_digits / 2)
    max_half = 10 ** half_digits - 1  # ex. 999
    min_half = 10 ** (half_digits - 1)  # ex. 100

    # palyndromes with even-odd digits are built slightly differently
    if not even_palyndromes:
        half_digits -= 1

    # for each half palyndrome (ex. 123)
    for h in range(max_half, min_half - 1, -1):
        # we pad the right with half_digits zeros (123000)
        pal = h * 10 ** half_digits
        # for each digit of the half palyndrome, starting from highest
        for i in range(half_digits):
            # we extract the n-highest digit
            if even_palyndromes:
                digit = h // 10 ** (half_digits - i - 1) % 10
            else:
                digit = h // 10 ** (half_digits - i) % 10
            # we add it to the n-lowest position
            pal += digit * 10 ** i
        yield pal


def _both_divisors_have_n_digits(palyndrome, divisorDigits):
    max_divisor = (10 ** divisorDigits) - 1
    min_divisor = 10 ** (divisorDigits - 1)
    for largest_divisor in range(max_divisor, min_divisor - 1, -1):
        if palyndrome % largest_divisor == 0:
            if (palyndrome / largest_divisor) // 10 ** divisorDigits == 0:
                return True
    return False


if __name__ == "__main__":
    print(largest_palyndrome(3))
