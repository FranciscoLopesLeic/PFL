:- consult('flugelrad.pl').
:- consult('utils.pl').
:- consult('main.pl').


% Modify the play predicate to call main_menu with the chosen mode
play :-
  nl, % Start on a new line
  write('Welcome to Flugelrad!'), nl,
  main_menu(Mode). % Call main_menu with the chosen mode

% The main game loop
game_loop(GameState, Mode) :-
  repeat,
  display_game(GameState), % Display the current game state
  (
    Mode = 'computer_computer',
    ai_vs_ai_turn(GameState, NewGameState) % AI vs. AI turn
    ;
    Mode \= 'computer_computer',
    player_move(GameState, NewGameState) % Human vs. Human or Human vs. Computer turn
  ),
  game_over(NewGameState, Winner), % Check if the game is over
  (
    Winner = 'Draw', nl, write('The game is a draw.'), nl, !
    ;
    Winner \= none, nl, format('Player ~w wins!', [Winner]), nl, !
  ),
  toggle_player(NewGameState, NextPlayer), % Toggle the player for the next turn
  set_current_player(NewGameState, NextPlayer, UpdatedGameState), % Update the current player in the game state
  game_loop(UpdatedGameState, Mode). % Recursive call to continue the game


% Handle the player move
player_move(GameState, NewGameState) :-
  GameState = [Board, Player],
  (
    Player = 'X', % Human player turn
    repeat,
    get_move(Player, Move),
    valid_moves(Board, Player, ValidMoves), % Find valid moves for the current player
    member(Move, ValidMoves), % Check if the move is a valid move
    move(GameState, Move, NewGameState),
    !
    ;
    Player = 'O', % Computer player turn
    choose_move(GameState, Player, Level, Move),
    move(GameState, Move, NewGameState)
  ).


% Toggle the player for the next turn
toggle_player(GameState, NextPlayer) :-
  GameState = [_, CurrentPlayer],
  toggle_player(CurrentPlayer, NextPlayer).

% Update the current player in the game state
set_current_player(GameState, NewPlayer, UpdatedGameState) :-
  GameState = [Board, _],
  UpdatedGameState = [Board, NewPlayer].



% Define the ai_vs_ai_turn predicate for AI vs. AI gameplay
ai_vs_ai_turn(GameState, NewGameState) :-
  GameState = [Board, Player],
  % Determine the difficulty of the current AI player based on Player
  get_ai_difficulty(Player, Difficulty),
  % Call the choose_move predicate from ai.pl to make the AI choose a move
  choose_move(GameState, Player, Difficulty, Move),
  move(GameState, Move, NewGameState).

% Define a predicate to get the difficulty of the AI player
get_ai_difficulty('X', Difficulty) :- % You can customize difficulty based on Player
  computer_difficulty(Difficulty).

get_ai_difficulty('O', Difficulty) :- % Customize difficulty for 'O' player if needed
  computer_difficulty(Difficulty).