-module(remove_item).
-export([main/0]).

main() ->
  Lista = [1, 2, 3, 4, 5],
  io:format("La lista es ~p~n", [Lista]),
  NuevaLista = remove_element(2, Lista),
  io:format("La nueva lista depues de eliminar el elemento en la posicion 2 es: ~p~n", [NuevaLista)).
  
remove_element(Index, Items) ->
    {Left, [_|Right]} = lists:split(Index-1, Items),
    Left ++ Right.
