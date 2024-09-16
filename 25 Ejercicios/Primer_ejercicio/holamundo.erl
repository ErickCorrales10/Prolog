%------------------------------------------------------------------------------
% Módulo:       holamundo
% Propósito:    Imprimir un mensaje de "Hola, Mundo!" en la consola.
% 
% Autor:        Erick Corrales
% Fecha:        12 de septiembre de 2024
% Versión:      1.0
%
% Descripción: 
% Este módulo define una función simple que imprime "Hola, mundo!" en la consola.
% Es un ejemplo introductorio para mostrar la estructura básica de un programa
% en Erlang, así como el uso de funciones de entrada/salida.
%
% Dependencias:
% Ninguna.
%
% Ejemplo de Uso:
% 1. Compilar el módulo: 
%    c(holamundo).
% 2. Llamar a la función:
%    holamundo:main().
%
% Historial de Cambios:
% 12/09/2024 - 1.0 - Creación del módulo con función básica `main/0`.
%
%------------------------------------------------------------------------------

-module(holamundo).
-export([main/0]).

main()->
	io:format("Hola, mundo!~n").