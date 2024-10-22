""" def dividir_lista(lista, n):
    lista1 = []
    lista2 = []

    for i in range(len(lista)):
        if i < n:
            lista1.append(lista[i])
        else:
            lista2.append(lista[i])

    return lista1, lista2 """

def dividir_lista(lista, n):
    return lista[:n], lista[n:] # Usar slicing para dividir la lsita en dos partes

lista = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
print(f"Lista original: {lista}")
n = 3
lista1, lista2 = dividir_lista(lista, n)
print(f'Lista 1: {lista1}')
print(f'Lista 2: {lista2}')
