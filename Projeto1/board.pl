% Define the initial game state with an 8x8 board
initial_state([[_, _, _, _, _, _, _, _],
               [_, _, _, _, _, _, _, _],
               [_, _, _, _, _, _, _, _],
               [_, _, _, _, _, _, _, _],
               [_, _, _, _, _, _, _, _],
               [_, _, _, _, _, _, _, _],
               [_, _, _, _, _, _, _, _],
               [_, _, _, _, _, _, _, _]], 'X').

% Display the 8x8 game board
display_board(Board) :-
  nl, % Start on a new line
  display_rows(Board).

% Display rows of the board
display_rows([]).
display_rows([Row | Rest]) :-
  display_row(Row),
  display_rows(Rest).

% Display a single row
display_row([]) :- nl.
display_row([Cell | Rest]) :-
  write(' '), write(Cell), write(' |'),
  display_row(Rest).