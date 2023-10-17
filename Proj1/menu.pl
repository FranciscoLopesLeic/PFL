/**
Menu principal
*/
menu :-
    repeat,
    display_main_menu,
    read_option(Option),
    separator,
    process_option(Option).

/**
Display Menu principal
*/
display_main_menu :-
    separator,
    nl,
    write('            Welcome to Flügelrad Game'), nl,
    write('            -------------------------'), nl,
    write('           1. Human vs Human (PvP)'), nl,
    write('           2. Human vs Computer (PvC)'), nl,
    write('           3. Computer vs Computer (CvC)'), nl,
    write('           0. Exit'), nl,
    separator,
    write('Enter your choice: ').

read_option(Option) :-
    read_number(Option).

process_option(0) :- exit_game.
process_option(1) :- start_pvp_game.
process_option(2) :- start_pvc_game.
process_option(3) :- start_cvc_game.
process_option(_) :- invalid_option.

start_pvp_game :-
    separator,
    write('Starting Player vs Player game...'), nl,

start_pvc_game :-
    separator,
    write('Starting Player vs Computer game...'), nl,
    readComputerMode(Computer),
    (
        Computer = 0
        ;
        pvc_mode(Computer),
        startPvC(Computer)
    ).

pvc_mode(1) :- separator, write('                                   Easy'), n1, separator.
pvc_mode(2) :- separator, write('                                   Hard'), n1, separator.

start_cvc_game :-
    separator,
    write('Starting Computer vs Computer game...'), nl,
    readComputerMode(Computer1),
    (
        Computer1 = 0
        ;
        readComputerMode(Computer2),
        (
            Computer2 = 0
            ;
            cvc_mode(Computer1-Computer2),
            startCvC(Computer1-Computer2)
        )
    ).

cvc_mode(1-1) :- separator, write('                               Easy vs Easy'), nl, separator.
cvc_mode(1-2) :- separator, write('                               Easy vs Hard'), nl, separator.
cvc_mode(2-1) :- separator, write('                               Hard vs Easy'), nl, separator.
cvc_mode(2-2) :- separator, write('                               Hard vs Hard'), nl, separator.

exit_game :-
    separator,
    write('Exiting Flügelrad Game. Goodbye!'), nl,
    separator,
    halt.

invalid_option :-
    write('Invalid option! Please select a valid option.'), nl.

separator :-
    nl,
    write('------------------------------------------------'), nl,
    nl.

readComputerMode(Level) :-
    repeat,
    level_menu,
    read_number(Level),
    separator,
    choose_level_option(Level).

choose_level_option(0).
choose_level_option(1).
choose_level_option(2).
choose_level_option(_) :-
    write('Invalid option! Please select a valid option.'), nl, !, fail.
    

level_menu :-
    write('                          Choose Computer Level                          '), nl, nl,
    write('                                 1. Easy                                 '), nl,
    write('                                 2. Hard                                 '), nl, nl,
    write('                                 0. Back                                 '), nl,
    separator, write('                               Option: ').