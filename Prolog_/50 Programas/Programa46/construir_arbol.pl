% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que construye arboles binarios completamente equilibrados

% -------- Código en Python (comentado) ------------
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def cbal_tree(n):
%     # Caso base: si N es 0, el árbol es nil (None en Python).
%     if n == 0:
%         return None
%
%     # Crear un nodo con valor 'x'.
%     node = TreeNode('x')
%
%     # Dividir el número de nodos en dos subárboles.
%     n1, n2 = divide(n - 1)
%
%     # Construir subárboles izquierdo y derecho.
%     node.left = cbal_tree(n1)
%     node.right = cbal_tree(n2)
%
%     return node
%
% def divide(n):
%     n1 = n // 2      # Número de nodos en el subárbol izquierdo.
%     n2 = n - n1      # Número de nodos en el subárbol derecho.
%     return n1, n2
%
% def tree_to_string(node):
%     if node is None:
%         return "nil"
%     return f"t({node.value}, {tree_to_string(node.left)}, {tree_to_string(node.right)})"
%
% # Número de nodos que quieres en el árbol.
% N = 7  # Puedes cambiar este valor para construir un árbol con diferentes números de nodos.
% tree = cbal_tree(N)
%
% # Imprimir la representación del árbol.
% print(f"Árbol completamente equilibrado con {N} nodos:")
% print(tree_to_string(tree))
% -------- Código en Prolog --------------------

% Construye un árbol binario completamente equilibrado con N nodos.
% Un árbol completamente equilibrado tiene subárboles cuya diferencia de tamaño es como máximo 1.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- 
    N > 0,
    N1 is N - 1,
    divide(N1, N2, N3), 
    cbal_tree(N2, L), 
    cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- 
    N1 is N // 2, 
    N2 is N - N1.

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- cbal_tree(3, Tree).
% Output:
% Tree = t('x', t('x', nil, nil), t('x', nil, nil)).
% -----------------------------------------------------------------
