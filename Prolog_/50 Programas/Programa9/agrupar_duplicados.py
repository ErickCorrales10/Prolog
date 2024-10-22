lista = []
lista_agrupada = []

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

# Agrupar duplicados consecutivos
def agrupar_duplicados():
    if not lista:
        return []
    
    i = 0
    lista_agrupar = []

    while i < len(lista):
        lista_agrupar.append(lista[i])
        while i < len(lista) - 1 and lista[i] == lista[i + 1]:
            i += 1
            lista_agrupar.append(lista[i])

        lista_agrupada.append(lista_agrupar)
        lista_agrupar = []
        i += 1

ingresar_elemenos()
agrupar_duplicados()
print(lista_agrupada)
