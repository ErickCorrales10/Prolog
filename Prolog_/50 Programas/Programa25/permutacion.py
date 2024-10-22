import random

def rnd_permu(lista):
    # Genera una permutación aleatoria de la lista
    return rnd_select(lista, len(lista))

def rnd_select(lista, n):
    # Caso base: si N es 0, devuelve una lista vacía
    if n == 0:
        return []
    
    # Si la lista está vacía y se solicita un número mayor a 0, retorna una lista vacía
    if not lista:
        return []
    
    # Seleccionar un índice aleatorio
    index = random.randint(0, len(lista) - 1)
    selected_element = lista[index]
    
    # Crear una nueva lista sin el elemento seleccionado
    lista_permutada = lista[:index] + lista[index + 1:]
    
    # Llamada recursiva para seleccionar los elementos restantes
    return [selected_element] + rnd_select(lista_permutada, n - 1)


lista = [1, 2, 3, 4, 5, 6, 7, 8, 9]
lista_permutada = rnd_permu(lista)
print("Lista original:", lista)
print("Permutación aleatoria:", lista_permutada)
