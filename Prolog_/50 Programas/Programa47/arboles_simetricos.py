class TreeNode:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

def is_symmetric(node):
    # Un árbol vacío es simétrico.
    if node is None:
        return True
    # Comprueba si el subárbol izquierdo y derecho son espejos.
    return mirror(node.left, node.right)

def mirror(left, right):
    # Dos árboles vacíos son espejos.
    if left is None and right is None:
        return True
    # Si uno es vacío y el otro no, no son espejos.
    if left is None or right is None:
        return False
    # Comprueba si los subárboles son espejos.
    return (left.value == right.value) and mirror(left.left, right.right) and mirror(left.right, right.left)

def tree_to_string(node):
    if node is None:
        return "nil"
    return f"t({node.value}, {tree_to_string(node.left)}, {tree_to_string(node.right)})"

# Ejemplo de árbol binario simétrico
symmetric_tree = TreeNode('a',
    TreeNode('b',
        TreeNode('c'),
        TreeNode('d')
    ),
    TreeNode('b',
        TreeNode('d'),
        TreeNode('c')
    )
)

# Ejemplo de árbol binario no simétrico
asymmetric_tree = TreeNode('a',
    TreeNode('b',
        TreeNode('c'),
        None
    ),
    TreeNode('b',
        None,
        TreeNode('c')
    )
)

# Verificar y mostrar si el árbol es simétrico
for tree in [symmetric_tree, asymmetric_tree]:
    print(f"Árbol: {tree_to_string(tree)}")
    if is_symmetric(tree):
        print("Es un árbol simétrico.\n")
    else:
        print("No es un árbol simétrico.\n")
