
def rotar_lista(lista, n):
    if len(lista) == 0:
        return lista
    
    length = len(lista)

    n = n % length

    return lista[n:] + lista[:n]


lista = [1, 2, 3, 4, 5]
print(f"Lista original: {lista}")
print(f"Lista rotada: {rotar_lista(lista, 2)}")