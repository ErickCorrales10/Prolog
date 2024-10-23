from collections import defaultdict

def length_frequency(l):
    length_groups = defaultdict(list)

    for sublist in l:
        length = len(sublist)
        length_groups[length].append(sublist)

    result = []
    for length, groups in sorted(length_groups.items()):
        count = len(groups)  
        for group in groups:
            result.append([count, group])

    return result

lista = [['a', 'b'], ['c'], ['d', 'e', 'f'], ['g'], ['h', 'i'], ['j']]
resultado = length_frequency(lista)
print("Frecuencia de longitudes:", resultado)

