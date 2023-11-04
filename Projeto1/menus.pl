:- consult('flugelrad.pl').
:- consult('ai.pl').

% Define a dynamic predicate to store the computer player difficulty level
:- dynamic computer_difficulty/1.



% Main menu
main_menu :-
  repeat,
  nl, % Start on a new line
  write('===== Flugelrad Game Menu ====='), nl,
  write('1. Human vs. Human'), nl,
  write('2. Human vs. Computer'), nl,
  write('3. Computer vs. Computer'), nl,
  write('4. Exit Game'), nl,
  write('Enter your choice (1-4): '),
  read(Choice),
  process_choice(Choice).

% Process the user choice from the main menu
process_choice(1) :- initialize_game('human_human').
process_choice(2) :- initialize_game('human_computer').
process_choice(3) :- initialize_game('computer_computer').
process_choice(4) :- exit_game.
process_choice(_) :-
  write('Invalid choice. Please enter a valid option (1-4).'), nl,
  fail.


% Initialize the game based on the selected mode
initialize_game(Mode) :-
  nl, % Start on a new line
  write('Initializing the game...'), nl,
  initial_state(Board, 'X'), % Initialize with the board and the starting player (e.g., 'X' or 'O')
  GameState = [Board, 'X'], % Set up the initial game state with the board and starting player
  (
    Mode = 'human_human', % If it "Human vs. Human" mode
    set_computer_difficulty('easy') % Set computer player difficulty to 'easy' by default
    ;
    Mode = 'human_computer', % If it "Human vs. Computer" mode
    choose_difficulty('human_computer') % Call the choose_difficulty predicate with the mode
    ;
    Mode = 'computer_computer', % If it "Computer vs. Computer" mode
    set_computer_difficulty('easy') % Set computer player difficulty to 'easy' by default for the first AI
  ),
  game_loop(GameState). % Start the game loop with the initial game state




% Start a new game
start_new_game :-
  nl, % Start on a new line
  write('Starting a new game...'), nl,
  % Remove any existing computer player difficulty level to reset it
  retractall(computer_difficulty(_)),
  initialize_game, % Initialize the game
  game_loop.

% Choose the computer player difficulty level
choose_difficulty(Mode) :-
  repeat,
  nl, % Start on a new line
  write('Choose Computer Player Difficulty:'), nl,
  write('1. Easy'), nl,
  write('2. Hard'), nl,
  write('Enter your choice (1-2): '),
  read(DifficultyChoice),
  set_computer_difficulty(DifficultyChoice),
  (
    Mode = 'human_computer', % If it "Human vs. Computer" mode
    main_menu('human_computer') % Pass the mode to the main menu
    ;
    Mode = 'computer_computer', % If it "Computer vs. Computer" mode
    initialize_game('computer_computer') % Initialize the game for "Computer vs. Computer" mode
  ).


% Set the computer player difficulty level
set_computer_difficulty(1) :-
  assertz(computer_difficulty(easy)),
  nl, write('Computer player set to Easy.'), nl.

set_computer_difficulty(2) :-
  assertz(computer_difficulty(hard)),
  nl, write('Computer player set to Hard.'), nl.

set_computer_difficulty(_) :-
  write('Invalid choice. Please enter a valid option (1-2).'), nl,
  choose_difficulty.

% Exit the game
exit_game :-
  nl, % Start on a new line
  write('Exiting the game. Goodbye!'), nl,
  halt.