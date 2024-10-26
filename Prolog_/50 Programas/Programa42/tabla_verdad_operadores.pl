% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog utiliza operadores logicos para definir expresiones
%              y generar  tablas de verdad

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%     static void Main(string[] args)
%     {
%         Console.WriteLine("Truth Table for AND");
%         GenerateTruthTable("and");
%
%         Console.WriteLine("\nTruth Table for OR");
%         GenerateTruthTable("or");
%
%         Console.WriteLine("\nTruth Table for NAND");
%         GenerateTruthTable("nand");
%
%         Console.WriteLine("\nTruth Table for NOR");
%         GenerateTruthTable("nor");
%
%         Console.WriteLine("\nTruth Table for XOR");
%         GenerateTruthTable("xor");
%
%         Console.WriteLine("\nTruth Table for IMPLICATION");
%         GenerateTruthTable("impl");
%
%         Console.WriteLine("\nTruth Table for EQUIVALENCE");
%         GenerateTruthTable("equ");
%     }
%
%     static void GenerateTruthTable(string operatorType)
%     {
%         // Generates the truth table based on the specified operator
%         Console.WriteLine("A B Result");
%
%         switch (operatorType)
%         {
%             case "and":
%                 Table(true, true, And);
%                 Table(true, false, And);
%                 Table(false, true, And);
%                 Table(false, false, And);
%                 break;
%
%             case "or":
%                 Table(true, true, Or);
%                 Table(true, false, Or);
%                 Table(false, true, Or);
%                 Table(false, false, Or);
%                 break;
%
%             case "nand":
%                 Table(true, true, Nand);
%                 Table(true, false, Nand);
%                 Table(false, true, Nand);
%                 Table(false, false, Nand);
%                 break;
%
%             case "nor":
%                 Table(true, true, Nor);
%                 Table(true, false, Nor);
%                 Table(false, true, Nor);
%                 Table(false, false, Nor);
%                 break;
%
%             case "xor":
%                 Table(true, true, Xor);
%                 Table(true, false, Xor);
%                 Table(false, true, Xor);
%                 Table(false, false, Xor);
%                 break;
%
%             case "impl":
%                 Table(true, true, Impl);
%                 Table(true, false, Impl);
%                 Table(false, true, Impl);
%                 Table(false, false, Impl);
%                 break;
%
%             case "equ":
%                 Table(true, true, Equ);
%                 Table(true, false, Equ);
%                 Table(false, true, Equ);
%                 Table(false, false, Equ);
%                 break;
%         }
%     }
%
%     static void Table(bool A, bool B, Func<bool, bool, bool> expr)
%     {
%         bool result = expr(A, B);
%         Console.WriteLine("{A} {B} {result}");
%     }
%
%     // Logical operations
%     static bool And(bool A, bool B) => A && B;
%     static bool Or(bool A, bool B) => A || B;
%     static bool Nand(bool A, bool B) => !(A && B);
%     static bool Nor(bool A, bool B) => !(A || B);
%     static bool Xor(bool A, bool B) => A ^ B;
%     static bool Impl(bool A, bool B) => !A || B;
%     static bool Equ(bool A, bool B) => (A && B) || (!A && !B);
% }
% -------- Código en Prolog --------------------

% Predicado table(A, B, Expr) que genera una tabla de verdad para expresion logicas
% en dos variables

table(A, B, Expr) :-
    write(A), write(' '), write(B), write(' '), 
    (call(Expr) -> write(true); write(false)),
    nl.
table(_, _, _).

% Genera la tabla de verdad para un operador lógico dado.
generate_truth_table(Operador) :-
    % Definir el predicado correspondiente según el operador
    (   Operador = and, 
        table(true, true, and(true, true)),
        table(true, false, and(true, false)),
        table(false, true, and(false, true)),
        table(false, false, and(false, false))
    ;   Operador = or, 
        table(true, true, or(true, true)),
        table(true, false, or(true, false)),
        table(false, true, or(false, true)),
        table(false, false, or(false, false))
    ;   Operador = nand, 
        table(true, true, nand(true, true)),
        table(true, false, nand(true, false)),
        table(false, true, nand(false, true)),
        table(false, false, nand(false, false))
    ;   Operador = nor, 
        table(true, true, nor(true, true)),
        table(true, false, nor(true, false)),
        table(false, true, nor(false, true)),
        table(false, false, nor(false, false))
    ;   Operador = xor, 
        table(true, true, xor(true, true)),
        table(true, false, xor(true, false)),
        table(false, true, xor(false, true)),
        table(false, false, xor(false, false))
    ;   Operador = impl, 
        table(true, true, impl(true, true)),
        table(true, false, impl(true, false)),
        table(false, true, impl(false, true)),
        table(false, false, impl(false, false))
    ;   Operador = equ, 
        table(true, true, equ(true, true)),
        table(true, false, equ(true, false)),
        table(false, true, equ(false, true)),
        table(false, false, equ(false, false))
    ).


% Definición de los operadores básicos AND, OR, NAND, NOR, XOR, IMPLICACIÓN, EQUIVALENCIA.
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.


% -----------------------------------------------------------------
% Ejemplos de uso
% ?- generate_truth_table(and).
% Output:
% true true true
% true false false
% false true false
% false false false
% -----------------------------------------------------------------
