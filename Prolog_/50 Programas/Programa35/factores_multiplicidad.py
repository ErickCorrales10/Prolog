def next_factor(f):
    return f + 2 if f > 2 else 3

def prime_factors(n):
    factors = []
    if n <= 1:
        return factors
    f = 2
    while f * f <= n:
        while n % f == 0:
            factors.append(f)
            n //= f
        f = next_factor(f)
    if n > 1:
        factors.append(n)
    return factors

def count_occurrences(x, lst):
    return lst.count(x)

def remove_occurrences(x, lst):
    return [y for y in lst if y != x]

def encode(factors):
    encoded = []
    while factors:
        h = factors[0]
        count = count_occurrences(h, factors)
        encoded.append((h, count))
        factors = remove_occurrences(h, factors)
    return encoded

def prime_factors_mult(n):
    """Determina los factores primos con su multiplicidad."""
    factors = prime_factors(n)
    return encode(factors)

print(prime_factors_mult(28))
