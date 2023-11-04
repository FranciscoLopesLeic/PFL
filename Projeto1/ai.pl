:- consult('flugelrad.pl').

% Define the choose_move/4 predicate
choose_move(GameState, Player, Level, Move) :-
  (
    Level = 1, % Easy difficulty (random move)
    random_move(GameState, Move)
    ;
    Level = 2, % Hard difficulty (greedy move)
    greedy_move(GameState, Player, Move)
  ).

% Generate a random move for the computer player
random_move(GameState, Move) :-
  GameState = [Board, Player],
  valid_moves(Board, Player, ValidMoves),
  random_member(Move, ValidMoves).

% Choose a move using a greedy algorithm for the computer player
greedy_move(GameState, Player, BestMove) :-
  GameState = [Board, Player],
  valid_moves(Board, Player, ValidMoves),
  find_best_move(GameState, Player, ValidMoves, -999, none, BestMove).

% Helper predicate to find the best move using a greedy algorithm
find_best_move(_, _, [], BestValue, BestMove, BestMove) :-
  BestValue \= -999.

find_best_move(GameState, Player, [Move | RestMoves], BestValue, BestMove, FinalBestMove) :-
  simulate_move(GameState, Move, SimulatedState),
  value(SimulatedState, Player, Value),
  (
    Value > BestValue,
    NewBestValue is Value,
    NewBestMove = Move
    ;
    NewBestValue is BestValue,
    NewBestMove = BestMove
  ),
  find_best_move(GameState, Player, RestMoves, NewBestValue, NewBestMove, FinalBestMove).

% Simulate a move to get the game state after the move
simulate_move([Board, Player], Move, [NewBoard, NewPlayer]) :-
  move([Board, Player], Move, [NewBoard, NewPlayer]).