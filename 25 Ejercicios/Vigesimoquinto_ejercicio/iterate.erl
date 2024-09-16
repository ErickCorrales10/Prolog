%------------------------------------------------------------------------------
% Módulo:       iterate
% Propósito:	Iterar sobre un mapa con claves y valores.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Acceder a cada clave con su valor 'x' desde un map e imprimirlos.
% 
% Dependencias
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(iterate).
% 2. Llamar a la función:
%    iterate:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0` y `iterar/1`.
%
%------------------------------------------------------------------------------
-module(iterate).
-export([main/0]).

main() ->
	Mapa = #{nombre => "Erick", edad => 30, ciudad => "Tijuana"},
	iterar(Mapa).


iterar(Mapa) ->
	maps:fold(
		fun(Key, Value, Acc) ->
			io:format("Clave: ~p, Valor: ~p~n", [Key, Value]),
			Acc
		end,
		ok,
		Mapa
	).



