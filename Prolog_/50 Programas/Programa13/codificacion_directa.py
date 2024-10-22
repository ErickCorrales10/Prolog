def encode_direct(lista):
    if not lista:
        return []
    
    encoded = []
    count = 1
    current = lista[0]

    for i in range(1, len(lista)):
        if lista[i] == current:
            count += 1
        else:
            encoded.append((count, current))
            current = lista[i]
            count = 1

    # Agregar el ultimo grupo
    encoded.append((count, current))
    return encoded

def count(x, lista):
    count = 0
    for item in lista:
        if item == x:
            count += 1
        else:
            break

    return count

def expand(x, n):
    return [x] * n

# Ejemplo de us
lista = ['a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd']
codificada = encode_direct(lista)
print(codificada)