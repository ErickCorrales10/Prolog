from math import gcd, isqrt
from functools import reduce
from collections import Counter

def compare_totient(n):
    phi_basic = totient(n)
    phi_improved = totient_improved(n)
    print(f"Phi (método básico): {phi_basic}")
    print(f"Phi (método mejorado): {phi_improved}")

def totient(n):
    if n == 1:
        return 1
    return sum(1 for k in range(1, n + 1) if gcd(n, k) == 1)

def totient_improved(n):
    factors = prime_factors_with_multiplicity(n)
    return reduce(lambda phi, p_m: phi * ((p_m[0] - 1) * p_m[0] ** (p_m[1] - 1)), factors, 1)

def prime_factors_with_multiplicity(n):
    factors = prime_factors(n)
    return list(Counter(factors).items())

def prime_factors(n):
    factors = []
    factor = 2
    while factor * factor <= n:
        while n % factor == 0:
            factors.append(factor)
            n //= factor
        factor += 1 if factor == 2 else 2  # Pasar al siguiente número impar
    if n > 1:
        factors.append(n)
    return factors

compare_totient(30)
