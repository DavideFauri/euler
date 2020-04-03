# least common multiple
def lcm(a, b):
    return abs(a * b) / gcd(a, b)


# greater common divisor
def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a
