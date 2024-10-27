% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que aplica construye arboles binarios equilibrados en altura

% -------- Código en Python (comentado) ------------
% class Node:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
%     def __repr__(self):
%         return f"t({self.value}, {self.left}, {self.right})"
%
% def hbal_tree(height):
%     """Construye un árbol binario equilibrado en altura con una altura dada."""
%     if height == 0:
%         return None  # Un árbol de altura 0 es nil (vacío)
%     elif height == 1:
%         return Node('x')  # Un árbol de altura 1 tiene un solo nodo
%     
%     # Crear el árbol de altura H
%     left_subtree = hbal_tree(height - 1)  # Subárbol izquierdo
%     right_subtree = hbal_tree(height - 1)  # Subárbol derecho
%     tree1 = Node('x', left_subtree, right_subtree)
%
%     left_subtree = hbal_tree(height - 1)  # Subárbol izquierdo
%     right_subtree = hbal_tree(height - 2)  # Subárbol derecho
%     tree2 = Node('x', left_subtree, right_subtree)
%
%     return [tree1, tree2]  # Retorna ambas estructuras posibles
%
% # Función para mostrar los árboles generados
% def print_trees(trees):
%     for tree in trees:
%         print(tree)
%
% # Ejemplo de uso
% h = 3  # Cambia la altura aquí para ver diferentes árboles
% trees = hbal_tree(h)
% print(f"Árboles equilibrados en altura de altura {h}:")
% print_trees(trees)

% -------- Código en Prolog --------------------

% Construye un árbol binario equilibrado en altura con una altura dada.
hbal_tree(0, nil).  % Un árbol de altura 0 es nil (vacío).
hbal_tree(1, t('x', nil, nil)).  % Un árbol de altura 1 tiene un solo nodo.
hbal_tree(H, t('x', L, R)) :- 
    H > 1, 
    H1 is H - 1, 
    hbal_tree(H1, L),  % Subárbol izquierdo
    hbal_tree(H1, R).  % Subárbol derecho
hbal_tree(H, t('x', L, R)) :- 
    H > 1, 
    H1 is H - 1, 
    H2 is H1 - 1, 
    hbal_tree(H1, L),  % Subárbol izquierdo
    hbal_tree(H2, R).  % Subárbol derecho

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- hbal_tree(3, Tree). 
% Output:
% Tree = t(x, t(x, t(x, nil, nil), t(x, nil, nil)), t(x, t(x, nil, nil), t(x, nil, nil))) .
% -----------------------------------------------------------------
