male(frank).
female(grace).
male(phil).
female(claire).
male(dylan).
female(haley).
male(george).
female(poppy).
male(alex).
male(luke).
female(lily).
male(rexford).
male(calhoun).
male(joe).
female(manny).
male(cameron).
male(pameron).
female(bo).
female(dede).
male(jay).
female(gloria).
male(javier).
female(barb).
male(merle).
male(mitchell).
parent(grace,phil).
parent(frank,phil).
parent(dede,claire).
parent(jay,claire).
parent(dede,mitchell).
parent(jay,mitchell).
parent(gloria,joe).
parent(jay,joe).
parent(gloria,manny).
parent(javier,manny).
parent(barb,cameron).
parent(merle,cameron).
parent(barb,pameron).
parent(merle,pameron).
parent(pameron,calhoun).
parent(bo,calhoun).
parent(cameron,lily).
parent(cameron,rexford).
parent(mitchell,rexford).
parent(mitchell,lily).
parent(phil,haley).
parent(phil,alex).
parent(phil,luke).
parent(claire,alex).
parent(claire,luke).
parent(claire,haley).
parent(haley,poppy).
parent(haley,george).
parent(dylan,poppy).
parent(dylan,george).
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
grandparent(X, Y) :- male(X), parent(Z, Y), parent(X, Z).
siblings(X, Y) :- parent(Z, X), parent(Z, Y), parent(W, X), parent(W, Y), W@<Z, W\=Z.
halfsibling(X,Y) :- parent(P, X), parent(P, Y), parent(L, X), parent(K, Y), X\=Y, L\=K, P\=L, P\=K.
cousins(X, Y) :- parent(P,X) , parent(F,Y), siblings(P,F), P\=F, X\=Y.