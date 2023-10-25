% Initialize the game and start the game loop.
play_game :-
    initial_board(Board), % Define your initial game board.
    display_board(Board), % Display the initial board.
    play(player1, Board). % Start the game with player 1.

% Game loop.
play(Player, Board) :-
    write('Player '), write(Player), write('\'s turn.'), nl,
    display_board(Board), % Display the current board.

    % Get the players move (row and column).
    get_player_move(Row, Col),

    % Check if the move is valid and make the move.
    (
        valid_move(Board, Row, Col) ->
        make_move(Player, Row, Col, Board, NewBoard),
        (
            check_win(NewBoard, Player) ->
            display_board(NewBoard),
            write('Player '), write(Player), write(' wins!'), nl
            ;
            (
                check_draw(NewBoard) ->
                display_board(NewBoard),
                write('It\'s a draw!'), nl
                ;
                % Switch to the next player and continue the game.
                (Player = player1 -> NextPlayer = player2 ; NextPlayer = player1),
                play(NextPlayer, NewBoard)
            )
        )
        ;
        write('Invalid move. Try again.'), nl,
        play(Player, Board)
    ).

% Get the players move (row and column) from input.
get_player_move(Row, Col) :-
    write('Enter your move (row col): '),
    read(Row), read(Col).

% Predicate to validate a move (check if the cell is empty).
valid_move(Board, Row, Col) :-
    nth1(Row, Board, RowList),
    nth1(Col, RowList, empty).

% Replace an element in a list at a given index.
replace([_|T], 1, X, [X|T]).
replace([H|T], I, X, [H|R]) :-
    I > 1,
    I1 is I - 1,
    replace(T, I1, X, R).

% Entry point to start the game.
start_game :-
    write('Welcome to Flügelrad Game!'), nl,
    play_game.

% Example usage:
% To start the game, call start_game from the Prolog interpreter.
