% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que comprueba si un termino dado es un arbol binario

% -------- Código en Python (comentado) ------------
% class TreeNode:
%     def __init__(self, value, left=None, right=None):
%         self.value = value
%         self.left = left
%         self.right = right
%
% def is_tree(node):
%     # Un árbol vacío es un árbol binario válido.
%     if node is None:
%         return True
%     
%     # Verifica si el nodo es un nodo válido de un árbol binario.
%     if isinstance(node, TreeNode):
%         return is_tree(node.left) and is_tree(node.right)
%     
%     return False  # No es un árbol binario si el nodo no es None o TreeNode.
%
% def check_tree_structure(structure):
%     return is_tree(structure)
%
% def tree_to_string(node):
%     if node is None:
%         return "nil"
%     return f"t({node.value}, {tree_to_string(node.left)}, {tree_to_string(node.right)})"
%
% # Definición de la estructura del árbol directamente en el código
% tree_structure = TreeNode('n',
%     TreeNode('k',
%         TreeNode('c',
%             TreeNode('a'),  # nil se representa como None en Python
%             TreeNode('e',
%                 TreeNode('d'),
%                 TreeNode('g')
%             )
%         ),
%         TreeNode('m')
%     ),
%     TreeNode('u',
%         TreeNode('p',
%             None, 
%             TreeNode('q')
%         ),
%         None
%     )
% )
%
% # Convertir la estructura del árbol a una cadena
% tree_string = tree_to_string(tree_structure)
%
% # Verificar si la estructura es un árbol binario
% if check_tree_structure(tree_structure):
%     print(f"{tree_string}: es un árbol binario.")
% else:
%     print(f"{tree_string}: no es un árbol binario.")
% -------- Código en Prolog --------------------

% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.
istree(nil).
istree(t(_, L, R)) :- 
    istree(L), 
    istree(R).

% -----------------------------------------------------------------
% Ejemplos de uso
% ?- istree(t(n, 
%               t(k,
%                   t(c, 
%                       t(a, nil, nil), 
%                       t(e, 
%                           t(d, nil, nil), 
%                           t(g, nil, nil))), 
%                        t(m, nil, nil)),
%                    t( u, 
%                       t(p, nil, t(q, nil, nil)), 
%                       nil)
%                )
%            )
% Output:
% true
% -----------------------------------------------------------------
