class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

def construct(values):
    tree = None
    for value in values:
        tree = add(value, tree)
    return tree

def add(value, node):
    # Caso base: agregar un nuevo nodo
    if node is None:
        return TreeNode(value)
    # Si el valor es menor, ir a la izquierda
    if value < node.value:
        node.left = add(value, node.left)
    # Si el valor es mayor o igual, ir a la derecha
    else:
        node.right = add(value, node.right)
    return node

def tree_to_string(node):
    if node is None:
        return "nil"
    return f"t({node.value}, {tree_to_string(node.left)}, {tree_to_string(node.right)})"

# Lista de enteros para construir el árbol
values = [5, 3, 8, 1, 4, 7, 9]

# Construir el árbol binario de búsqueda
bst = construct(values)

# Mostrar la representación del árbol
print("Árbol Binario de Búsqueda:", tree_to_string(bst))
