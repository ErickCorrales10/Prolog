%------------------------------------------------------------------------------
% Módulo:       buscar
% Propósito:	Devuelve true si el elemento está en la lista, false en caso contrario
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Comprobar si un elemento pertenece a una lista usando funciones estándar de Erlang.
% Dependencias
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(buscar).
% 2. Llamar a la función:
%    buscar:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `buscar/2`.
%
%------------------------------------------------------------------------------
-module(buscar).
-export([main/0, buscar/2]).

main() ->
	Lista = ["Erick", 10, "Melissa", "Messi"],
	Elemento1 = "Roberto",
	Elemento2 = "Melissa",
	io:format("~p se ecuentra en la lista? ~p~n", [Elemento1, buscar(Elemento1, Lista)]),
	io:format("~p se ecuentra en la lista? ~p~n", [Elemento2, buscar(Elemento2, Lista)]).

% Devuelve true si el elemento está en la lista, false en caso contrario
buscar(Elemento, Lista) ->
	lists:member(Elemento, Lista).
