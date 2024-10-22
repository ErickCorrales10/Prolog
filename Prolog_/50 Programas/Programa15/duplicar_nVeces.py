""" def duplicar(lista, n):
    lista_duplicada = []

    for i in range(len(lista)):
        j = 0
        while j < n:
            lista_duplicada.append(lista[i])
            j += 1

    return lista_duplicada """

def duplicar(lista, n):
    # Compresión de listas para duplicar los elementos
    return [elemento for elemento in lista for _ in range(n)]

lista = ['a', 'b', 'c']
print(f'Lista original: {lista}')
n = 3
lista = duplicar(lista, n)
print(f"Elementos duplicados en la lista {n} veces: {lista}")


