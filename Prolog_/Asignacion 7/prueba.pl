% Función que coloca palabras en las filas
match_rows([], [], []).
match_rows([Row|RestRows], [Word|RestWords], [NewRow|RestNewRows]) :-
    match_puzzle(Row, Word, NewRow),
    match_rows(RestRows, RestWords, RestNewRows).

% Función que coloca palabras en las columnas
match_columns([], [], []).
match_columns([Row|RestRows], [Word|RestWords], [NewColumn|RestNewColumns]) :-
    transpose([Row|RestRows], Transposed),
    match_puzzle(Transposed, Word, NewColumn),
    match_columns(RestRows, RestWords, RestNewColumns).

% Función que intenta emparejar una palabra con una fila o columna
match_puzzle([], [], []).
match_puzzle([Cell|RestCells], [Letter|RestLetters], [Letter|RestNewCells]) :-
    (Cell == '.'; Cell == Letter), % Puede estar vacío o coincidir con la letra
    match_puzzle(RestCells, RestLetters, RestNewCells).

solve_crossword(Puzzle, Words, Solution) :-
    maplist(atom_chars, Words, CharsWords),
    match_rows(Puzzle, CharsWords, RowsSolution),
    match_columns(Puzzle, CharsWords, ColumnsSolution),
    % Aquí podrías combinar RowsSolution y ColumnsSolution de alguna forma.
    Solution = RowsSolution.
