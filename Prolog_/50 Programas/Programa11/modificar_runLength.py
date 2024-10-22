def encode_modified(list):
    # Codifica la lista y luego aplica la modificiación
    encoded = encode(list)
    return modify(encoded)

def modify(encoded):
    result = []

    for count, element in encoded:
        if count == 1:
            result.append(element) # Si hay uno, agrega el elemento directamente
        else:
            result.append(f'{count}{element}') # Si hay más de uno, agrega el número seguido del elemento

    return result  

def encode(list):
    # Agrupa lso elementos consecutivos y los transforma en parejas (N, X)
    packed = pack(list)
    return transform(packed)

def pack(list):
    if not list:
        return []
    
    packed = []

    current_group = [list[0]]

    for element in list[1:]:
        if element ==  current_group[-1]:
            current_group.append(element)
        else:
            packed.append(current_group)
            current_group = [element]

    packed.append(current_group)
    return packed

def transform(packed):
    # Transforma las sublistas en parejas (N, X)
    return [(len(sublista), sublista[0]) for sublista in packed]

# Ejemplo de uso
lista = ['a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e']
result = encode_modified(lista)
print(result)

