def insertar_elemento(lista, elemento, posicion):
    lista.insert(posicion, elemento)
    return lista


lista = [1, 2, 3, 4, 'a']
print(f"Lista original: {lista}")
print(f"Lista modificada: {insertar_elemento(lista, 'x', 2)}")

