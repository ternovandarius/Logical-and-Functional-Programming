%a

appendToList([], L, L):-!.
appendToList(X, L, [X|L]).

removeAtom([], _, []):-!.
removeAtom([H|T], E, R):-
    H is E,
    !,
    removeAtom(T, E, R).
removeAtom([H|T], E, R):-
    removeAtom(T, E, R1),
    appendToList(H, R1, R).

%b

nrOcc([], _, 0):-!.
nrOcc([H|T], E, R):-
    H is E,
    !,
    nrOcc(T, E, R1),
    R is R1+1.
nrOcc([_|T], E, R):-
    nrOcc(T, E, R).

isInVisited([H|_], E):-
    H is E,!.
isInVisited([_|T], E):-
    isInVisited(T, E).

createOccList([], _, []):-!.
createOccList([H|T], V, R):-
    isInVisited(V, H),
    !,
    createOccList(T, V, R).
createOccList([H|T], V, R):-
    appendToList(H, V, V1),
    nrOcc([H|T], H, C),
    createOccList(T, V1, R1),
    appendToList(C, R1, R2),
    appendToList(H, R2, R).
