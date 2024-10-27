class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

def cbal_tree(n):
    if n == 0:
        return [None]  # Un árbol vacío
    if n == 1:
        return [TreeNode('x')]  # Un solo nodo
    trees = []
    # Dividir los nodos entre subárboles izquierdo y derecho
    for left_size in range(n):
        right_size = n - 1 - left_size
        left_trees = cbal_tree(left_size)
        right_trees = cbal_tree(right_size)
        for left in left_trees:
            for right in right_trees:
                trees.append(TreeNode('x', left, right))
    return trees

def mirror(left, right):
    if left is None and right is None:
        return True
    if left is None or right is None:
        return False
    return mirror(left.left, right.right) and mirror(left.right, right.left)

def symmetric(tree):
    if tree is None:
        return True
    return mirror(tree.left, tree.right)

def sym_cbal_trees(n):
    all_trees = cbal_tree(n)
    symmetric_trees = []
    for tree in all_trees:
        if symmetric(tree):
            symmetric_trees.append(tree)
    return symmetric_trees

def tree_to_string(node):
    if node is None:
        return "nil"
    return f"t({node.value}, {tree_to_string(node.left)}, {tree_to_string(node.right)})"

# Número de nodos para generar árboles
N = 5

# Obtener árboles simétricos completamente equilibrados
symmetric_trees = sym_cbal_trees(N)

# Mostrar los árboles simétricos
if symmetric_trees:
    for i, tree in enumerate(symmetric_trees):
        print(f"Árbol simétrico {i + 1}: {tree_to_string(tree)}")
else:
    print("No se encontraron árboles simétricos.")

