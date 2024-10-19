lista = []

while True:
    print("Elemento a ingresar a la lista ('Salir' para terminar de agregar): ", end='')
    elemento = input()
    if elemento.lower() == 'salir':
        break
    else:
        try:
            if '.' in elemento:
                elemento = float(elemento) # Conversión a float
            else:
                elemento = int(elemento) # Conversión a int
            lista.append(elemento)
        except:
            lista.append(elemento)

print(lista)
lista_invertida = lista[::-1] # Invierte la lista creando una nueva lista, sin modificar la original
# lista.reverse() # Invierte la lista modificando la lista actual
# print(lista)
print(lista_invertida)