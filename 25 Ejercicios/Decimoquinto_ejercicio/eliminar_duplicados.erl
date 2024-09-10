-module(eliminar_duplicados).
-export([main/0, eliminar_duplicados_/1]).

main() ->
	ListaDuplicados = ["Erick", "Erick", "Messi", "Melissa", 10],
	ListaSinDuplicados = eliminar_duplicados_(ListaDuplicados),
	io:format("La lista con duplicados es: ~p~n", [ListaDuplicados]),
	io:format("La lista sin duplicados: ~p~n", [ListaSinDuplicados]).

% Elimina los elementos duplicados de una lista
eliminar_duplicados_(L) ->
	lists:usort(L).
