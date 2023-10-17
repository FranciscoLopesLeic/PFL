/**Int to char map*/
letter(0, 'A').
letter(1, 'B').
letter(2, 'C').
letter(3, 'D').
letter(4, 'E').
letter(5, 'F').
letter(6, 'G').
letter(7, 'H').
letter(8, 'I').
letter(9, 'J').
letter(10, 'K').
letter(11, 'L').
letter(12, 'M').
letter(13, 'N').
letter(14, 'O').
letter(15, 'P').
letter(16, 'Q').

/**Winner*/
announce(Winner) :-
  write('Winner: ', Winner), nl.

/**Directions:
Noroeste - 0
Norte - 1
Nordeste - 2
Sudoeste - 3
Sul - 4
Sudeste - 5
*/
direction(0, -1, -1).
direction(1, -2, 0).
direction(2, -1, 1).
direction(3, 1, -1).
direction(4, 2, 0).
direction(5, 1, 1).

directions([[-1, -1], [-2, 0], [-1, 1], [1, -1], [2, 0], [1, 1]]).
