def solve_crossword(puzzle, words):
    while words:
        verificar_palabras_horizontal(puzzle, words)
        verificar_palabras_vertical(puzzle, words)

def verificar_palabras_horizontal(puzzle, words):
    i = 0
    j = 0
    k = 0
    ban = True

    while ban:
        palabra = words[i]

        if j <= len(puzzle) - 1:
            if palabra[i] == puzzle[j][k]:
                resultado = checar_palabras(palabra, puzzle[0])
                if resultado:
                    modificar_puzzle_horizontal(puzzle, palabra, j)
                    words.pop(j)
                    ban = False
                else:
                    if k < (len(puzzle[j]) - 1):
                        k += 1
                    elif j < (len(puzzle) - 1):
                        j += 1
                
            elif k < len(puzzle[j]) - 1:
                k += 1
            else:
                j += 1
                k = 0
        else:
            ban = False

def verificar_palabras_vertical(puzzle, words):
    i = 0
    j = 0
    palabras = len(puzzle[i])

    palabras_ = [[] for _ in range(palabras)] # Lista de listas vacía
    
    while j < palabras:
        for i in range(len(puzzle)):
            palabras_[j].append(puzzle[i][j])

        j += 1

    i = 0
    j = 0
    k = 0
    ban = True

    while ban:
        palabra = words[i]

        if j <= len(palabras_) - 1:
            if palabra[i] == palabras_[j][k]:
                resultado = checar_palabras(palabra, palabras_[0])
                if resultado:
                    modificar_puzzle_vertical(puzzle, palabra, j)
                    palabras_.pop(j)
                    words.pop(0)
                    ban = False
                else:
                    if k < (len(palabras_[j]) - 1):
                        k += 1
                    elif j < (len(palabras_) - 1):
                        j += 1
                
            elif k < len(palabras_[j]) - 1:
                k += 1
            else:
                j += 1
                k = 0
        else:
            ban = False


def checar_palabras(palabra, palabra_crucigrama):
    i = 0
    lista_palabra = []
    
    while i < len(palabra_crucigrama):
        if palabra[i] != '.':
            lista_palabra.append(palabra_crucigrama[i])
        else:
            break

    palabra_crucigrama = ''.join(lista_palabra)
    
    if len(palabra) ==  len(palabra_crucigrama):
        return True
    else:
        return False

def modificar_puzzle_horizontal(puzzle, palabra, posicion):
    for i in range(0, len(palabra)):
        puzzle[posicion][i] = palabra[i]

def modificar_puzzle_vertical(puzzle, palabra, posicion):
    for i in range(0, len(palabra)):
        puzzle[i][posicion] = palabra[i]

def imprimir_crucigrama(puzzle):
    for i in puzzle:
        print(i)


# Ejemplo de uso
puzzle = [
    ['P', ' ', ' ', 'L', ' ', 'G', '.', '.', 'E'],
    [' ', '.', 'N', '.', '.', ' ', '.', '.', ' '],
    [' ', '.', 'L', ' ', ' ', 'U', ' ', '.', 'A'],
    ['L', '.', ' ', '.', ' ', '.', 'M', ' ', ' '],
    ['.', '.', 'N', '.', 'S', ' ', ' ', '.', ' '],
    ['.', ' ', ' ', 'B', '.', '.', '.', '.', '.']
]

# words = ['LINUX', 'SQL', 'WEB', 'PROLOG', 'EMACS', 'MAC', 'PERL', 'XML', 'ONLINE', 'NFS', 'GNU']
words = ['PROLOG']

print('\n\n\t\tCrucigrama sin resolver:\n')
imprimir_crucigrama(puzzle)

solve_crossword(puzzle, words)

print('\n\n\t\tCrucigrama resuelto:\n')
imprimir_crucigrama(puzzle)

