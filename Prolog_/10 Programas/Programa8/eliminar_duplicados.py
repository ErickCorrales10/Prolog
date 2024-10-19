lista = []

def ingresar_elemenos():
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

# Eliminar duplicados consecutivos
def eliminar_duplicados():
    i = 0 # Indice para recorrer la lista

    while i < len(lista) - 1:
        if lista[i] == lista[i + 1]: 
            lista.pop(i + 1) # Eliminar duplicado
        else:
            i += 1

ingresar_elemenos()
eliminar_duplicados()
print(lista)
