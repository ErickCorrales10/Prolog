%------------------------------------------------------------------------------
% Módulo:       suma_lista
% Propósito:	Suma los elementos de una lista recursivamente.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Implementar una función recursiva para sumar los elementos de una lista.
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(suma_lista).
% 2. Llamar a la función:
%    suma_lista:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `sumar_lista/1`.
%
%------------------------------------------------------------------------------
-module(suma_lista).
-export([main/0, sumar_lista/1]).

main() ->
	List = [45, 150, 11, 10],
	Suma = sumar_lista(List),
	io:format("La suma de la lista ~p es ~p~n", [List, Suma]).

% Sumar los elementos de una lista recursivamente
sumar_lista([]) ->
	0;
sumar_lista([H|T]) ->
	H + sumar_lista(T).
