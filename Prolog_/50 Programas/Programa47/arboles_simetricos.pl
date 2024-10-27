% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que comprueba si un arbol binario es simetrico

% -------- Código en Python (comentado) ------------
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def is_symmetric(node):
%     # Un árbol vacío es simétrico.
%     if node is None:
%         return True
%     # Comprueba si el subárbol izquierdo y derecho son espejos.
%     return mirror(node.left, node.right)
%
% def mirror(left, right):
%     # Dos árboles vacíos son espejos.
%     if left is None and right is None:
%         return True
%     # Si uno es vacío y el otro no, no son espejos.
%     if left is None or right is None:
%         return False
%     # Comprueba si los subárboles son espejos.
%     return (left.value == right.value) and mirror(left.left, right.right) and mirror(left.right, right.left)
%
% def tree_to_string(node):
%     if node is None:
%         return "nil"
%     return f"t({node.value}, {tree_to_string(node.left)}, {tree_to_string(node.right)})"
%
% # Ejemplo de árbol binario simétrico
% symmetric_tree = TreeNode('a',
%     TreeNode('b',
%         TreeNode('c'),
%         TreeNode('d')
%     ),
%     TreeNode('b',
%         TreeNode('d'),
%         TreeNode('c')
%     )
% )
%
% # Ejemplo de árbol binario no simétrico
% asymmetric_tree = TreeNode('a',
%     TreeNode('b',
%         TreeNode('c'),
%         None
%     ),
%     TreeNode('b',
%         None,
%         TreeNode('c')
%     )
% )
%
% # Verificar y mostrar si el árbol es simétrico
% for tree in [symmetric_tree, asymmetric_tree]:
%     print(f"Árbol: {tree_to_string(tree)}")
%     if is_symmetric(tree):
%         print("Es un árbol simétrico.\n")
%     else:
%         print("No es un árbol simétrico.\n")
% -------- Código en Prolog --------------------

% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
symmetric(nil).
symmetric(t(_, L, R)) :- 
    mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- 
    mirror(L1, R2), 
    mirror(R1, L2).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- symmetric(t(a, t(b, t(c, nil, nil), t(d, nil, nil)), t(b, t(d, nil, nil), t(c, nil, nil)))).
% Output:
% true
% -----------------------------------------------------------------
