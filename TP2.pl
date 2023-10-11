factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.
sum_rec(0, 0). 
sum_rec(N, Sum) :-
    N > 0,         
    N1 is N - 1,   
    sum_rec(N1, SubSum), 
    Sum is SubSum + N.   
pow_rec(_, 0, 1). 
pow_rec(X, Y, P) :-
    Y > 0,         
    Y1 is Y - 1,   
    pow_rec(X, Y1, P1), 
    P is X * P1.   
fibonacci(1,1).
fibonacci(2,1).
fibonacci(N, F):-
    N > 2,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, _prevFib1),
    fibonacci(N2, _prevFib2),
    F is _prevFib1 + _prevFib2.


is_prime(X) :-
    X > 1,
    is_prime(X, 2).
is_prime(X, X) :- !.
is_prime(X, Y) :-
    X > 2,
    Y < X,
    X mod Y =\= 0,  
    Y2 is Y + 1,
    is_prime(X, Y2). 

