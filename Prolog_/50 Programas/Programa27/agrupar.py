from itertools import combinations

def grupo_elementos(lista, tam):
    if not lista and not tam:
        return [[]]
    
    if not lista or not tam:
        return []
    
    tamanio = tam[0]
    resultado = []
    
    for group in combinations(lista, tamanio):
        elementos_restantes = [item for item in lista if item not in group]
        grupos_restantes = grupo_elementos(elementos_restantes, tam[1:])
        for rest_groups in grupos_restantes:
            resultado.append([list(group)] + rest_groups)

    return resultado

lista = [1, 2, 3, 4, 5, 6]
tam = [2, 2, 2]
try:
    resultado = grupo_elementos(lista, tam)
    print(f"Grupos resultantes:")
    for i in resultado:
        print(i)
except ValueError as e:
    print(e)