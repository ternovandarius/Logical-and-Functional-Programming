appendToList([], L, L):-!.
appendToList(X, L, [X|L]).

checkLists([], []).
checkLists([H|T1], [H|T2]):-
    checkLists(T1, T2).

multip([H|[]], [H]):-!.
multip([H1, H2|T], R):-
    H1<H2->
    H3 is 2*H1,
    multip([H2|T], R1),
    appendToList(H3, R1, R);
    multip([H2|T], R1),
    appendToList(H1, R1, R).

wrapper(L, R):-
    multip(L, AUX),
    checkLists(L, AUX)->
    appendToList([], AUX, R);
    multip(L, AUX),
    wrapper(AUX, R).

wrapper2(L, R):-
    multip(L, AUX),
    checkLists(L, AUX),
    !,
    appendToList([], AUX, R).
wrapper2(L, R):-
    multip(L, AUX),
    wrapper(AUX, R).
