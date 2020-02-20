isMem([H|_], E):-H is E,!.
isMem([_|T], E):-isMem(T, E).

appendToList([], L, L):-!.
appendToList(X, L, [X|L]).

diffe(X, [], X):-!.
diffe([], _, []):-!.
diffe([H|T], L, R):-
    isMem(L, H),
    !,
    diffe(T, L, R).
diffe([H|T], L, R):-
    diffe(T, L, R1),
    appendToList(H, R1, R).
