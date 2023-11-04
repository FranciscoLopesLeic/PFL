:- consult('board.pl').
:- consult('input.pl').


% Define the move predicate
move(GameState, Move, NewGameState) :-
  % Extract the current board and player from the game state
  GameState = [Board, CurrentPlayer],

  % Validate the move (you should define move_exists/2)
  move_exists(Move, CurrentPlayer),

  % Apply the move to the board
  apply_move(Board, Move, NewBoard, CurrentPlayer),

  % Toggle the player (e.g., X becomes O and vice versa)
  toggle_player(CurrentPlayer, NewPlayer),

  % Update the game state with the new board and player
  NewGameState = [NewBoard, NewPlayer].

% Define a predicate to apply the move to the board
apply_move(Board, Move, NewBoard, Player) :-
  % Extract the column and row from the move
  atom_chars(Move, [ColChar, RowChar, '.']),
  char_code('A', A),
  char_code(ColChar, ColCode),
  char_code('1', One),
  char_code(RowChar, RowCode),

  % Convert column and row to list indices
  ColIndex is ColCode - A,
  RowIndex is RowCode - One,

  % Update the board with the new move
  replace(Board, RowIndex, ColIndex, Player, NewBoard).

% Define a predicate to toggle the player
toggle_player('X', 'O').
toggle_player('O', 'X').

% Define a predicate to replace an element in a list at a specified row and column
replace([H|T], 0, X, Y, [R|T]) :-
  replace_row(H, X, Y, R).
replace([H|T], I, X, Y, [H|R]) :-
  I > 0,
  I1 is I - 1,
  replace(T, I1, X, Y, R).

% Define a predicate to replace an element in a row at a specified column
replace_row([_|T], 0, X, [X|T]).
replace_row([H|T], I, X, [H|R]) :-
  I > 0,
  I1 is I - 1,
  replace_row(T, I1, X, R).

% Define valid_moves/3 to find all valid moves for a given game state and player
valid_moves(GameState, Player, ValidMoves) :-
  % Extract the game board from the game state
  GameState = [Board, _],
  
  % Find all valid moves for the current player
  findall(Move, move_exists(Board, Move, Player), ValidMoves).



% Define the move_exists predicate
move_exists(Move, Player) :-
  % Extract the column and row from the move
  atom_chars(Move, [ColChar, RowChar, '.']),
  char_code('A', A),
  char_code('H', H),
  char_code(ColChar, ColCode),
  char_code('1', One),
  char_code('8', Eight),
  char_code(RowChar, RowCode),
  ColCode >= A, ColCode =< H,
  RowCode >= One, RowCode =< Eight,

  % Access the game board directly
  board(Board), 
  ColIndex is ColCode - A,
  RowIndex is RowCode - One,
  nth0(RowIndex, Board, Row),
  nth0(ColIndex, Row, Cell),
  Cell == '.'.