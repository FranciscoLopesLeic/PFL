:- consult('flugelrad.pl').
:- consult('input.pl').


% Define a predicate to check if a player has won
player_wins(Player, GameState) :-
  % Extract the game board from the game state
  GameState = [Board, _],

  % Check for a winning cluster of at least six marbles for the given player
  winning_cluster(Board, Player).


% Define a predicate to check for a winning cluster of marbles
winning_cluster(Board, Player) :-
  % Define the possible directions for moving through the board
  Directions = [(1, 0), (0, 1), (-1, 1), (-1, 0), (0, -1), (1, -1)],
  
  % Iterate over each cell in the board
  forall(
    (nth0(RowIdx, Board, Row), nth0(CellIdx, Row, Cell), Cell == Player),
    (
      member((DX, DY), Directions),
      cluster_count(Board, RowIdx, CellIdx, DX, DY, 0, Player) >= 6 % Check for a winning cluster
    )
  ).

% Define a predicate to count a cluster of marbles in a given direction
cluster_count(_, _, _, _, _, Count, _) :- Count >= 6.
cluster_count(Board, X, Y, DX, DY, Count, Player) :-
  NewX is X + DX,
  NewY is Y + DY,
  valid_coordinates(Board, NewX, NewY), % Check if coordinates are valid
  nth0(NewY, Board, NewRow),
  nth0(NewX, NewRow, NewCell),
  NewCell == Player, % Check if the next cell belongs to the same player
  NewCount is Count + 1,
  cluster_count(Board, NewX, NewY, DX, DY, NewCount, Player).


% Define a predicate to check if coordinates are valid on the board
valid_coordinates(Board, X, Y) :-
  X >= 0, X < 8, % Adjust the bounds according to your board size
  Y >= 0, Y < 8. % Adjust the bounds according to your board size






% Define a predicate to check for a draw (game is tied)
is_draw(GameState) :-
  % Extract the current player from the game state
  GameState = [_, CurrentPlayer],

  % Get all valid moves for the current player using move_exists
  findall(Move, move_exists(Move, CurrentPlayer), ValidMoves),

  % If there are no valid moves left, the game is a draw
  length(ValidMoves, 0).


% Define a predicate to check if the game is over (either a win or a draw)
game_over(GameState, Winner) :-
  player_wins('X', GameState), Winner = 'X';
  player_wins('O', GameState), Winner = 'O';
  is_draw(GameState), Winner = 'Draw';
  Winner = none.