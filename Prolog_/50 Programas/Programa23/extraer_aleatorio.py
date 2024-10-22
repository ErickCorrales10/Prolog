import random

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
    nueva_lista = lista[:index] + lista[index + 1:]
    
    # Llamada recursiva para seleccionar los elementos restantes
    return [selected_element] + rnd_select(nueva_lista, n - 1)


lista = [1, 2, 3, 4, 5, 6, 7, 8, 9]
n = 3  # Número de elementos a seleccionar
selected_elements = rnd_select(lista, n)
print("Lista original:", lista)
print("Elementos seleccionados:", selected_elements)
