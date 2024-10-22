
# Ingresar la lista anidada desde el teclado
def ingresar_elementos():
    entrada = input("Ingresa una lista anidada (por ejemplo, [1, [2, [3, 4]], 5]): ")

    # Convertir la cadena ingresada en una lista usando eval
    try:
        lista_anidada = eval(entrada)  # eval convierte la cadena a una lista
        if isinstance(lista_anidada, list):  # Asegurarse de que la entrada sea una lista válida
            resultado = my_flatten(lista_anidada)
            print("Lista aplanada:", resultado)
        else:
            print("La entrada no es una lista válida.")
    except:
        print("Error: La entrada no es válida.")

def my_flatten(lista_anidada):
    lista = []  # Lista para almacenar los elementos aplanados
    for elemento in lista_anidada:
        if isinstance(elemento, list):
            lista.extend(my_flatten(elemento))  # Aplanar recursivamente si es una lista
        else:
            lista.append(elemento)  # Agregar el elemento si no es lista
    return lista

ingresar_elementos()
