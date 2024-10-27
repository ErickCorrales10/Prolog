% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que aplica el paradigma de generar y probar para construir
%              todos los arboles binarios simetricos y completamente equilibrados con un numero
%              dado de nodos

% -------- Código en Python (comentado) ------------
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def cbal_tree(n):
%     if n == 0:
%         return [None]  # Un árbol vacío
%     if n == 1:
%         return [TreeNode('x')]  # Un solo nodo
%     trees = []
%     # Dividir los nodos entre subárboles izquierdo y derecho
%     for left_size in range(n):
%         right_size = n - 1 - left_size
%         left_trees = cbal_tree(left_size)
%         right_trees = cbal_tree(right_size)
%         for left in left_trees:
%             for right in right_trees:
%                 trees.append(TreeNode('x', left, right))
%     return trees
%
% def mirror(left, right):
%     if left is None and right is None:
%         return True
%     if left is None or right is None:
%         return False
%     return mirror(left.left, right.right) and mirror(left.right, right.left)
%
% def symmetric(tree):
%     if tree is None:
%         return True
%     return mirror(tree.left, tree.right)
%
% def sym_cbal_trees(n):
%     all_trees = cbal_tree(n)
%     symmetric_trees = []
%     for tree in all_trees:
%         if symmetric(tree):
%             symmetric_trees.append(tree)
%     return symmetric_trees
%
% def tree_to_string(node):
%     if node is None:
%         return "nil"
%     return f"t({node.value}, {tree_to_string(node.left)}, {tree_to_string(node.right)})"
%
% # Número de nodos para generar árboles
% N = 5
%
% # Obtener árboles simétricos completamente equilibrados
% symmetric_trees = sym_cbal_trees(N)
%
% # Mostrar los árboles simétricos
% if symmetric_trees:
%     for i, tree in enumerate(symmetric_trees):
%         print(f"Árbol simétrico {i + 1}: {tree_to_string(tree)}")
% else:
%     print("No se encontraron árboles simétricos.")

% -------- Código en Prolog --------------------

% Definir un nodo del árbol binario
tree(nil). % Un árbol vacío
tree(t(X, L, R)) :- tree(L), tree(R). % Un árbol con valor X y subárboles L y R

% Generar árboles binarios completamente equilibrados
cbal_tree(0, [nil]). % Árbol vacío
cbal_tree(1, [t(x, nil, nil)]). % Un solo nodo
cbal_tree(N, Trees) :-
    N > 1,
    N1 is N - 1,
    findall(t(x, Left, Right),
            (between(0, N1, LeftSize),
            RightSize is N1 - LeftSize,
            cbal_tree(LeftSize, LeftTrees),
            cbal_tree(RightSize, RightTrees),
            member(Left, LeftTrees),
            member(Right, RightTrees)),
            Trees).

% Verificar si dos árboles son espejos
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :-
    mirror(L1, R2),
    mirror(R1, L2).

% Verificar si un árbol es simétrico
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Generar árboles simétricos completamente equilibrados
sym_cbal_trees(N, SymTrees) :-
    cbal_tree(N, Trees),
    include(symmetric, Trees, SymTrees).

% Convertir el árbol a cadena de texto
tree_to_string(nil, 'nil').
tree_to_string(t(X, L, R), Str) :-
    tree_to_string(L, LStr),
    tree_to_string(R, RStr),
    format(string(Str), 't(~w, ~w, ~w)', [X, LStr, RStr]).

% Mostrar los árboles simétricos
show_symmetric_trees(N) :-
    sym_cbal_trees(N, SymTrees),
    ( SymTrees = [] -> writeln('No se encontraron arboles simetricos.')
    ; show_trees(SymTrees, 1)
    ).

show_trees([], _).
show_trees([Tree | Rest], Index) :-
    tree_to_string(Tree, Str),
    format('Arbol simetrico ~w: ~w~n', [Index, Str]),
    NextIndex is Index + 1,
    show_trees(Rest, NextIndex).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- show_symmetric_trees(5).
% Output:
% Arbol simetrico 1: t(x, t(x, nil, t(x, nil, nil)), t(x, t(x, nil, nil), nil))
% Arbol simetrico 2: t(x, t(x, t(x, nil, nil), nil), t(x, nil, t(x, nil, nil)))
% true.
% -----------------------------------------------------------------
