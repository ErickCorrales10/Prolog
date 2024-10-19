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

# Codificar en Run-Length
def codificar():
    if not lista:
        return []
    
    lista_codificada = []

    # Inicializar variables
    anterior = lista[0]
    contador = 1
    
    for i in range(1, len(lista)):
        if lista[i] == anterior:
            contador += 1
        else:
            lista_codificada.append((anterior, contador))
            anterior = lista[i]
            contador = 1
    
    lista_codificada.append((anterior, contador))
    
    return lista_codificada

ingresar_elemenos()
print(codificar())
