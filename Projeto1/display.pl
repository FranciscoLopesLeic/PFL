:- consult('board.pl').

% Display the game state
display_game(Board, Player) :-
  nl, % Start on a new line
  display_board(Board),
  nl,
  format("Current Player: ~w~n", [Player]).