class Node:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

    def __repr__(self):
        return f"t({self.value}, {self.left}, {self.right})"


def hbal_tree(height):
    """Construye un árbol binario equilibrado en altura con una altura dada."""
    if height == 0:
        return None  # Un árbol de altura 0 es nil (vacío)
    elif height == 1:
        return Node('x')  # Un árbol de altura 1 tiene un solo nodo
    
    # Crear el árbol de altura H
    left_subtree = hbal_tree(height - 1)  # Subárbol izquierdo
    right_subtree = hbal_tree(height - 1)  # Subárbol derecho
    tree1 = Node('x', left_subtree, right_subtree)

    left_subtree = hbal_tree(height - 1)  # Subárbol izquierdo
    right_subtree = hbal_tree(height - 2)  # Subárbol derecho
    tree2 = Node('x', left_subtree, right_subtree)

    return [tree1, tree2]  # Retorna ambas estructuras posibles

# Función para mostrar los árboles generados
def print_trees(trees):
    for tree in trees:
        print(tree)

# Ejemplo de uso
h = 3  # Cambia la altura aquí para ver diferentes árboles
trees = hbal_tree(h)
print(f"Árboles equilibrados en altura de altura {h}:")
print_trees(trees)
