%------------------------------------------------------------------------------
% Módulo:       par_impar
% Propósito:    Comprueba si un número es par o impar usando guardas.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Utilizar guardas en Erlang para decidir si un número es par o impar.
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(par_impar).
% 2. Llamar a la función:
%    par_impar:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `par_o_impar/1`.
%
%------------------------------------------------------------------------------
-module(par_impar).
-export([main/0, par_o_impar/1]).

main() ->
	par_o_impar(10).

par_o_impar(N) when N rem 2 == 0 ->
	io:format("El numero ingresado es Par~n");
par_o_impar(_) ->
	io:format("El numero ingresado es Impar~n").
