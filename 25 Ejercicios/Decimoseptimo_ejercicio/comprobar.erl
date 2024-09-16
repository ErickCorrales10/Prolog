%------------------------------------------------------------------------------
% Módulo:       comprobar
% Propósito:	Verifica si una lista está vacía.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Usar comparaciones simples para verificar si una lista está vacía.
% 
% Dependencias
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(comprobar).
% 2. Llamar a la función:
%    comprobar:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `esta_vacia/1`.
%
%------------------------------------------------------------------------------
-module(comprobar).
-export([main/0, esta_vacia/1]).

main() ->
	List = [1, 2, 3],
	Resultado = esta_vacia(List),
	io:format("La lista está vacía? ~p~n", [Resultado]).

% Verifica si una lista está vacía
esta_vacia(L) ->
	L == [].
