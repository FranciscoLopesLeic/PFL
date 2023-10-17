/**Int to char map*/
letter(0, 'A').
letter(1, 'B').
letter(2, 'C').
letter(3, 'D').
letter(4, 'E').
letter(5, 'F').
letter(6, 'G').

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
