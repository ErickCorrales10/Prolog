def gcd(x, y):
    while y:
        x, y = y, x % y
    return x

def coprime(x, y):
    return gcd(x, y) == 1

def totient_acc(m, k, acc):
    if k == 0:
        return acc
    if coprime(m, k):
        return totient_acc(m, k - 1, acc + 1)
    else:
        return totient_acc(m, k - 1, acc)

def totient(m):
    if m <= 1:
        return 1
    return totient_acc(m, m, 0)

print(totient(10))
print(totient(15))  
