% Get the players move input
get_move(Player, Move) :-
  repeat,
  write('Enter your move (e.g., "A3."): '),
  read(Move),
  valid_move(Move, Player),
  !.

% Validate if the players move is valid
valid_move(Move, Player) :-
  atom_chars(Move, [ColChar, RowChar, '.']),
  char_code('A', A),
  char_code('H', H),
  char_code(ColChar, ColCode),
  char_code('1', One),
  char_code('8', Eight),
  char_code(RowChar, RowCode),
  ColCode >= A, ColCode =< H,
  RowCode >= One, RowCode =< Eight,
  move_exists(Move, Player).