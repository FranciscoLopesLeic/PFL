:- consult('board.pl'). % Include your existing board visualization.
:- consult('utils.pl'). % Include utility predicates.
:- consult('gameloop.pl').

% Define the game board data structure.
initial_board([
    [empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty],
    [empty, empty, empty, empty, empty, empty]
]).

% Start the Flügelrad game.
start_game :-
    write('Welcome to Flügelrad Game!'), nl,
    initial_board(Board),
    display_board(Board), nl,
    play_game(player1, Board).

% Predicate to check if a player has won.
% Check for a win.
check_win(Board, Player) :-
    % Check for horizontal, vertical, and diagonal wins.
    (
        check_horizontal_win(Board, Player) ;
        check_vertical_win(Board, Player) ;
        check_diagonal_win(Board, Player)
    ).

% Check for a horizontal win.
check_horizontal_win(Board, Player) :-
    member(Row, Board),
    consecutive_pieces(Row, Player, 0, 4).

% Check for a vertical win.
check_vertical_win(Board, Player) :-
    transpose(Board, TransposedBoard), % Transpose the board.
    check_horizontal_win(TransposedBoard, Player). % Check for horizontal win in the transposed board.

% Check for a diagonal win.
check_diagonal_win(Board, Player) :-
    check_main_diagonal_win(Board, Player) ;
    check_anti_diagonal_win(Board, Player).

% Check for a win along the main diagonal.
check_main_diagonal_win(Board, Player) :-
    length(Board, NumRows),
    length(Board, NumCols),
    NumRows >= 4,
    NumCols >= 4,
    between(1, NumRows, StartRow),
    between(1, NumCols, StartCol),
    main_diagonal(StartRow, StartCol, MainDiagonal),
    consecutive_pieces(MainDiagonal, Player, 0, 4).

% Check for a win along the anti-diagonal.
check_anti_diagonal_win(Board, Player) :-
    length(Board, NumRows),
    length(Board, NumCols),
    NumRows >= 4,
    NumCols >= 4,
    between(1, NumRows, StartRow),
    between(1, NumCols, StartCol),
    anti_diagonal(StartRow, StartCol, AntiDiagonal),
    consecutive_pieces(AntiDiagonal, Player, 0, 4).

% Predicate to generate the main diagonal.
main_diagonal(Row, Col, [Cell | Rest]) :-
    nth1(Row, Board, RowList),
    nth1(Col, RowList, Cell),
    NewRow is Row + 1,
    NewCol is Col + 1,
    main_diagonal(NewRow, NewCol, Rest).

main_diagonal(_, _, []).

% Predicate to generate the anti-diagonal.
anti_diagonal(Row, Col, [Cell | Rest]) :-
    nth1(Row, Board, RowList),
    nth1(Col, RowList, Cell),
    NewRow is Row + 1,
    NewCol is Col - 1,
    anti_diagonal(NewRow, NewCol, Rest).

anti_diagonal(_, _, []).

% Example usage:
% Board is the game board, Player is the current player.
% To check if Player has won, call check_win(Board, Player).



% Predicate to check for a draw.
% Check for a draw.
check_draw(Board) :-
    board_is_full(Board),
    \+ (check_win(Board, _)).

% Predicate to check if the board is full.
board_is_full(Board) :-
    flatten(Board, FlattenedBoard),
    \+ member(empty, FlattenedBoard).

% Example usage:
% To check for a draw, call check_draw(Board).




% Main game loop.
play_game(Player, Board) :-
    write('Player '), write(Player), write(', make your move (row col): '),
    read(Row), read(Col),
    (
        valid_move(Board, Row, Col) ->
        make_move(Player, Row, Col, Board, NewBoard),
        display_board(NewBoard), nl,
        (
            check_win(NewBoard, Player) ->
            write('Player '), write(Player), write(' wins!'), nl
            ;
            (
                check_draw(NewBoard) ->
                write('It\'s a draw!'), nl
                ;
                (
                    Player = player1 -> NextPlayer = player2 ; NextPlayer = player1
                ),
                play_game(NextPlayer, NewBoard)
            )
        )
        ;
        write('Invalid move. Try again.'), nl,
        play_game(Player, Board)
    ).

% Entry point to start the game.
start_game :- start_game.
