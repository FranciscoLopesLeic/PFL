/*3. immature(X):- adult(X), !, fail.
immature(_X).
cut VERMELHO
adult(X):- person(X), !, age(X, N), N >=18.
adult(X):- turtle(X), !, age(X, N), N >=50.
adult(X):- spider(X), !, age(X, N), N>=1.
adult(X):- bat(X), !, age(X, N), N >=5.
cut VERDE*/

/*4.*/
max(A, B, C, Max):-
    (A >= B, A >= C, !, Max is A);
    (B >= A, B >= C, !, Max is B);
    (C >= A, C >= B, !, Max is C).

/*5. a)*/
print_n(0, _):- !.
print_n(N, S) :-
    N > 0,
    write(S),
    N1 is N - 1,
    print_n(N1, S).
