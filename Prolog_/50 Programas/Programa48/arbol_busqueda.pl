% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que construye un arbol de busqueda

% -------- Código en Python (comentado) ------------
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def construct(values):
%     tree = None
%     for value in values:
%         tree = add(value, tree)
%     return tree
%
% def add(value, node):
%     # Caso base: agregar un nuevo nodo
%     if node is None:
%         return TreeNode(value)
%     # Si el valor es menor, ir a la izquierda
%     if value < node.value:
%         node.left = add(value, node.left)
%     # Si el valor es mayor o igual, ir a la derecha
%     else:
%         node.right = add(value, node.right)
%     return node
%
% def tree_to_string(node):
%     if node is None:
%         return "nil"
%     return f"t({node.value}, {tree_to_string(node.left)}, {tree_to_string(node.right)})"
%
% # Lista de enteros para construir el árbol
% values = [5, 3, 8, 1, 4, 7, 9]
%
% # Construir el árbol binario de búsqueda
% bst = construct(values)
%
% # Mostrar la representación del árbol
% print("Árbol Binario de Búsqueda:", tree_to_string(bst))

% -------- Código en Prolog --------------------

% Definición del nodo del árbol
:- dynamic node/3.  % node(Value, Left, Right)

% Función para construir el árbol a partir de una lista de valores
construct([], nil).  % Caso base: lista vacía
construct([Value|Values], Tree) :-
    add(Value, nil, TreeSub),  % Iniciar el árbol con el primer valor
    construct(Values, TreeSub, Tree).  % Construir el árbol con los demás valores

% Función para agregar un valor al árbol
add(Value, nil, node(Value, nil, nil)).  % Caso base: agregar un nuevo nodo
add(Value, node(NodeValue, Left, Right), node(NodeValue, Left, NewRight)) :-
    Value > NodeValue,
    add(Value, Right, NewRight).  % Ir a la derecha
add(Value, node(NodeValue, Left, Right), node(NodeValue, NewLeft, Right)) :-
    Value =< NodeValue,
    add(Value, Left, NewLeft).  % Ir a la izquierda

% Función auxiliar para construir el árbol
construct([], Tree, Tree).  % Cuando no quedan más valores, devolver el árbol
construct([Value|Values], AccTree, FinalTree) :-
    add(Value, AccTree, NewTree),  % Agregar el valor al árbol acumulado
    construct(Values, NewTree, FinalTree).  % Continuar con los demás valores

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- construct([5, 3, 8, 1, 4, 7, 9], Tree).
% Output:
% Tree = node(5, node(3, node(1, nil, nil), node(4, nil, nil)), node(8, node(7, nil, nil), node(9, nil, nil))) .
% -----------------------------------------------------------------
