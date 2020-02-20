%a

gcd(A, 0, A):-!.
gcd(A, B, R):-
    C is mod(A, B),
    gcd(B, C, R).

lcm(0, 0, 0):-!.
lcm(A, B, R):-
    C is A*B,
    D is abs(C),
    gcd(A, B, E),
    R is D/E.

list([], C, C):-!.
list([H|T], C, R):-
    lcm(H, C, C1),
    list(T, C1, R).

wrapper(L, R):-
    list(L, 1, R).

%b

isMulTwo(1, _):-!.
isMulTwo(C, C):-!.
isMulTwo(V, C):-V>C, C1 is C*2, isMulTwo(V, C1).

appendToList([], L, L):-!.
appendToList(X, L, [X|L]).

addval([], _, _, []):-!.
addval([H|T], E, V, R):-
    isMulTwo(V, 1),
    !,
    V1 is V+1,
    addval(T, E, V1, R1),
    appendToList(E, R1, R2),
    appendToList(H, R2, R).
addval([H|T], E, V, R):-
    V1 is V+1,
    addval(T, E, V1, R1),
    appendToList(H, R1, R).
