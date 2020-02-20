appendToList([], L, L):-!.
appendToList(X, L, [X|L]).

isVisited([H|_], E):-
    H is E,
    !.
isVisited([_|T], E):-
    isVisited(T, E).

removeDupl([], _, []):-!.
removeDupl([H|T], V, R):-
    isVisited(V, H),
    !,
    removeDupl(T, V, R).
removeDupl([H|T], V, R):-
    appendToList(H, V, V1),
    removeDupl(T, V1, R1),
    appendToList(H, R1, R).

sorter([], []):-!.
sorter([H1, H2|T], R):-
    H1<H2,
    !,
    sorter(T, R1),
    appendToList(H2, R1, R2),
    appendToList(H1, R2, R).
sorter([H1, H2|T], R):-
    sorter(T, R1),
    appendToList(H1, R1, R2),
    appendToList(H2, R2, R).

compareLists([], []):-!.
compareLists([H1|T1], [H2|T2]):-
    H1 is H2,
    compareLists(T1, T2).

whiler(L1, L2, L1):-
    compareLists(L1, L2),
    !.
whiler(L1, L2, R):-
    sorter(L1, AUX),
    whiler(L2, AUX, R).

wrapper(L, R):-
    removeDupl(L, [], R1),
    whiler(R1, [], R).
