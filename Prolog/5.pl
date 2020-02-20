appendToList([], L, L):-!.
appendToList(X, L, [X|L]).


un([], [], []):-!.
un([], R, R):-!.
un(L, [], L):-!.
un([H1|T1], [H2|T2], R):-
    H1<H2,
    !,
    un(T1, [H2|T2], R1),
    appendToList(H1, R1, R).
un([H1|T1], [H2|T2], R):-
    H1>H2,
    !,
    un([H1|T1], T2, R1),
    appendToList(H2, R1, R).
un([H1|T1], [_|T2], R):-
    un(T1, T2, R1),
    appendToList(H1, R1, R).

pairup([], _, []):-!.
pairup([H|T], E, R):-
    pairup(T, E, R1),
    appendToList([E, H], R1, R).

unpack([], []):-!.
unpack([H|T], R):-
    unpack(T, R1),
    appendToList(H, R1, R).

pairs([], []):-!.
pairs([H|T], R):-
    pairs(T, R1),
    unpack(R1, R2),
    pairup(T, H, R2),
    unpack(R2, R).
