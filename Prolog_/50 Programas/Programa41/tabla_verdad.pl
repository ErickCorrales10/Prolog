% ===============================================
% Autor: Erick Corrales
% Fecha: 26 de octubre de 2024
% Descripción: Programa en Prolog crea una tabla de verdad para expresiones
%              logicas

% -------- Código en Python (comentado) ------------
% def and_operation(A, B):
%     return A and B
%
% def table(A, B, expr):
%     result = expr(A, B)
%     print(f"{A} {B} {result}")
%
% def generate_truth_table():
%     print("A B Result")
%     table(True, True, and_operation)
%     table(True, False, and_operation)
%     table(False, True, and_operation)
%     table(False, False, and_operation)
%
% generate_truth_table()
% -------- Código en Prolog --------------------

% Predicado table(A, B, Expr) que genera una tabla de verdad para expresion logicas
% en dos variables

table(A, B, Expr) :-
    write(A), write(' '), write(B), write(' '), 
    (call(Expr) -> write(true); write(false)),
    nl.
table(_, _, _).

% Define una expresión lógica: A AND B
and(A, B) :- 
    A, B.

% Genera la tabla de verdad para la expresión lógica AND
generate_truth_table :-
    table(true, true, and(true, true)),
    table(true, false, and(true, false)),
    table(false, true, and(false, true)),
    table(false, false, and(false, false)).


% -----------------------------------------------------------------
% Ejemplos de uso
% ?- generate_truth_table
% Output:
% true true true
% true false false
% false true false
% false false false
% -----------------------------------------------------------------
