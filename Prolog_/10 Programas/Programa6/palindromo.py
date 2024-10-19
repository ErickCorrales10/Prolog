lista = []

def ingresar_elementos():
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

def palindromo():
    for i in range(len(lista)):
        if lista[i] != lista[len(lista) - i - 1]:
            return False
    return True

ingresar_elementos()
print(lista)
print("La lista es palíndroma" if palindromo() else "La lista no es palíndroma")

