def goldbach(n):
    if n <= 2 or n % 2 != 0:
        raise ValueError("El número debe ser un número par mayor que 2.")
    
    primes = prime_list(2, n)
    for p1 in primes:
        p2 = n - p1
        if is_prime(p2):
            return (p1, p2)
    
    return None

def prime_list(low, high):
    return [p for p in range(low, high + 1) if is_prime(p)]

def is_prime(n):
    if n < 2:
        return False
    if n in (2, 3):
        return True
    if n % 2 == 0:
        return False
    return not has_factor(n, 3)

def has_factor(n, l):
    if l * l > n:
        return False
    if n % l == 0:
        return True
    return has_factor(n, l + 2)

n = 28  # Cambia este valor para probar con otros números
result = goldbach(n)
if result:
    print(f"Los dos primos que suman {n} son: {result[0]} y {result[1]}")
else:
    print(f"No se encontraron dos primos que sumen {n}.")
