%------------------------------------------------------------------------------
% Módulo:       prodcuto
% Propósito:	Calcula el producto de todos los elementos de una lista.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Calcular el producto de todos los elementos de una lista usando recursión.
% 
% Dependencias
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(producto).
% 2. Llamar a la función:
%    producto:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `producto_lista/1`.
%
%------------------------------------------------------------------------------
-module(producto).
-export([main/0, producto_lista/1]).

main() ->
	Lista = [1, 45, 2, 8, 65, 2],
	io:format("La lista original: ~p~n~n", [Lista]),
	io:format("EL producto de todos los elementos de la lista: ~p~n", [producto_lista(Lista)]).

% Calcula el producto de todos los elementos de una lista
producto_lista([]) ->
	1;
producto_lista([H|T]) ->
	H * producto_lista(T).
