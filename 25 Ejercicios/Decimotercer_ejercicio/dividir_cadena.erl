-module(dividir_cadena).
-export([main/0, dividir_cadena_/2]).

main() ->
	Cadena = "El hombre de negro viajaba a tráves del desierto, y el pistolero iba en pos de él",
	Separador = ",",
	Subcadenas = dividir_cadena_(Cadena, Separador),
	io:format("~nCadena original: ~p~n~n", [Cadena]),
	io:format("Subcadenas: ~p~n", [Subcadenas]).

% Divide una cadena en subcadenas usando un separador
dividir_cadena_(Cadena, Separador) ->
	string:split(Cadena, Separador).

