% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog que genera un arbol de Huffman dado un conjunto
%              de frecuencias

% -------- Código en C# (comentado) ------------
% public class HuffmanNode
% {
%     public string Symbol { get; set; }
%     public int Frequency { get; set; }
%     public HuffmanNode Left { get; set; }
%     public HuffmanNode Right { get; set; }
%
%     public HuffmanNode(string symbol, int frequency)
%     {
%         Symbol = symbol;
%         Frequency = frequency;
%         Left = Right = null;
%     }
%
%     public HuffmanNode(int frequency, HuffmanNode left, HuffmanNode right)
%     {
%         Symbol = null;
%         Frequency = frequency;
%         Left = left;
%         Right = right;
%     }
%
%     public bool IsLeaf => Left == null && Right == null;
% }
%
% public class HuffmanTree
% {
%     public List<HuffmanNode> Frequencies { get; set; }
%
%     public HuffmanTree()
%     {
%         Frequencies = new List<HuffmanNode>
%         {
%             new HuffmanNode("a", 5),
%             new HuffmanNode("b", 9),
%             new HuffmanNode("c", 12),
%             new HuffmanNode("d", 13),
%             new HuffmanNode("e", 16),
%             new HuffmanNode("f", 45)
%         };
%     }
%
%     public HuffmanNode GenerateTree()
%     {
%         var nodes = new List<HuffmanNode>(Frequencies.OrderBy(node => node.Frequency));
%
%         while (nodes.Count > 1)
%         {
%             var left = nodes[0];
%             var right = nodes[1];
%             nodes.RemoveAt(0);
%             nodes.RemoveAt(0);
%
%             var parent = new HuffmanNode(left.Frequency + right.Frequency, left, right);
%             nodes.Add(parent);
%
%             nodes = nodes.OrderBy(node => node.Frequency).ToList();
%         }
%
%         return nodes.FirstOrDefault();
%     }
%
%     public void DisplayTree(HuffmanNode node)
%     {
%         if (node == null) return;
%
%         if (node.IsLeaf)
%         {
%             Console.Write(node.Symbol);
%         }
%         else
%         {
%             Console.Write("(");
%             DisplayTree(node.Left);
%             Console.Write(" ");
%             DisplayTree(node.Right);
%             Console.Write(")");
%         }
%     }
% }
%
% class Program
% {
%     static void Main()
%     {
%         var huffmanTree = new HuffmanTree();
%         var root = huffmanTree.GenerateTree();
%         
%         Console.WriteLine("Árbol de Huffman:");
%         huffmanTree.DisplayTree(root);
%         Console.WriteLine();
%     }
% }
% -------- Código en Prolog --------------------

% Definimos el nodo de Huffman
huffman_node(simbolo(S), frecuencia(F), izquierdo(Izq), derecho(Der)).

% Definimos las frecuencias iniciales
frecuencias([
    huffman_node(simbolo("a"), frecuencia(5), izquierdo(nil), derecho(nil)),
    huffman_node(simbolo("b"), frecuencia(9), izquierdo(nil), derecho(nil)),
    huffman_node(simbolo("c"), frecuencia(12), izquierdo(nil), derecho(nil)),
    huffman_node(simbolo("d"), frecuencia(13), izquierdo(nil), derecho(nil)),
    huffman_node(simbolo("e"), frecuencia(16), izquierdo(nil), derecho(nil)),
    huffman_node(simbolo("f"), frecuencia(45), izquierdo(nil), derecho(nil))
]).

% Ordenamos los nodos por frecuencia
ordenar_por_frecuencia(Lista, Ordenada) :-
    predsort(compare_frecuencia, Lista, Ordenada).

compare_frecuencia(<, huffman_node(_, frecuencia(F1), _, _), huffman_node(_, frecuencia(F2), _, _)) :- F1 =< F2.
compare_frecuencia(>, huffman_node(_, frecuencia(F1), _, _), huffman_node(_, frecuencia(F2), _, _)) :- F1 > F2.

% Generación del árbol de Huffman
generar_arbol([Nodo], Nodo).
generar_arbol(Nodos, Arbol) :-
    ordenar_por_frecuencia(Nodos, [Izq, Der | Resto]),
    Izq = huffman_node(_, frecuencia(F1), _, _),
    Der = huffman_node(_, frecuencia(F2), _, _),
    FrecuenciaPadre is F1 + F2,
    Padre = huffman_node(simbolo(nil), frecuencia(FrecuenciaPadre), izquierdo(Izq), derecho(Der)),
    generar_arbol([Padre | Resto], Arbol).

% Visualización del árbol de Huffman
mostrar_arbol(huffman_node(simbolo(S), _, izquierdo(nil), derecho(nil))) :- 
    format("~w", [S]).

mostrar_arbol(huffman_node(_, _, izquierdo(Izq), derecho(Der))) :-
    format("("),
    mostrar_arbol(Izq),
    format(" "),
    mostrar_arbol(Der),
    format(")").

% Ejecución principal renombrada
ejecutar :-
    frecuencias(Frecuencias),
    generar_arbol(Frecuencias, Arbol),
    write("Árbol de Huffman: "),
    mostrar_arbol(Arbol),
    nl.

% Para ejecutar el programa, llama a ejecutar/0.


% -----------------------------------------------------------------
% Ejemplos de uso
% ?- ejcutar.
% Output:
% Arbol de huffman: (f ((c, d) ((a b) e)))
% -----------------------------------------------------------------
