# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


WORDS = {
    0: "zero",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
    10: "ten",
    11: "eleven",
    12: "twelve",
    13: "thirteen",
    14: "fourteen",
    15: "fifteen",
    16: "sixteen",
    17: "seventeen",
    18: "eighteen",
    19: "nineteen",
    20: "twenty",
    30: "thirty",
    40: "forty",
    50: "fifty",
    60: "sixty",
    70: "seventy",
    80: "eighty",
    90: "ninety",
    100: "hundred",
    1000: "thousand",
    10 ** 6: "million",
    10 ** 9: "billion",
    "&": "and",
}


def num2str_below_10e2(n):
    assert n < 10 ** 2
    if n == 0:
        return ""
    if n in WORDS:
        return WORDS[n]
    units = n % 10
    tens = n - units
    return num2str_below_10e2(tens) + num2str_below_10e2(units)


def num2str_below_10e3(n):
    assert n < 10 ** 3
    hundreds = n // 10 ** 2
    remainder = n % 10 ** 2
    result = ""
    if hundreds:
        result += WORDS[hundreds] + WORDS[100]
    if hundreds and remainder:
        result += WORDS["&"]
    if remainder:
        result += num2str_below_10e2(remainder)
    return result


def num2str_below_10e6(n):
    assert n < 10 ** 6
    thousands = n // 10 ** 3
    remainder = n % 10 ** 3
    result = ""
    if thousands:
        result += num2str_below_10e3(thousands) + WORDS[1000]
    if remainder:
        result += num2str_below_10e3(remainder)
    return result


def num2str_below_10e9(n):
    assert n < 10 ** 9
    millions = n // 10 ** 6
    remainder = n % 10 ** 6
    result = ""
    if millions:
        result += num2str_below_10e3(millions) + WORDS[10 ** 6]
    if remainder:
        result += num2str_below_10e6(remainder)
    return result


def num2str(n):
    if n == 0:
        return WORDS[0]
    # return num2str_below_10e2(n)
    # return num2str_below_10e3(n)
    # return num2str_below_10e6(n)
    return num2str_below_10e9(n)


def count_letters_between(n, m):
    return sum(len(num2str(n)) for n in range(n, m + 1))


if __name__ == "__main__":
    print(count_letters_between(1, 1000))
