% Definimos la sopa de letras como una lista de listas de letras.
letras(
  [[r, a, m, a, m, a, m, r],
   [f, r, e, t, n, i, e, v],
   [e, r, r, a, m, r, m, a],
   [l, r, a, b, a, a, r, m],
   [b, m, m, r, u, n, a, m],
   [r, o, m, z, o, r, m, r],
   [n, m, o, i, a, r, m, e],
   [r, n, s, m, r, a, a, m],
   [r, i, r, a, a, m, m, o],
   [r, m, r, a, a, r, m, r]]).

% Buscamos palabras sin las letras M, A, ni R.
valid_word(Word) :-
    \+ member(m, Word),
    \+ member(a, Word),
    \+ member(r, Word).

% Verificamos palabras en las filas o columnas.
find_words(List, Word) :-
    append(_, Word, List),
    length(Word, L), L >= 3, % Solo palabras de longitud >= 3
    valid_word(Word).

% Transponemos la matriz para obtener columnas.
transpose([], []).
transpose([[]|_], []).
transpose(Matrix, [Row|Rows]) :-
    maplist(nth0(0), Matrix, Row),
    maplist(nth1(1), Matrix, Rest),
    transpose(Rest, Rows).

% Encontrar todas las palabras en la sopa de letras.
solve :-
    letras(Grid),
    ( member(Row, Grid); % Buscamos en filas
      transpose(Grid, TransposedGrid),
      member(Row, TransposedGrid) % Buscamos en columnas
    ),
    find_words(Row, Word),
    write(Word), nl,
    fail.
solve.
