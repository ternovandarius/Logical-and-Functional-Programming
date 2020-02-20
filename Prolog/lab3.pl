/*
 * a. Determine the successor of a number represented as digits in a list.
 *
 * appendToList(x, {a1, ..., an}) = {x, a1, ..., an}
 *
 * modifyFirst(x, {a1, ..., an})= x+1, a1=0
 *                                x, a1>0
 *
 * maina(A={a1, ..., an})= {a1+1} U maina({a2, ..., an}), a2'=0
 *                         {a1} U maina({a2, ..., an}), a2'>0
 *                         a1+1, n=1
 *
 * gethead({a1, ..., an}) = a1
 *
 * handlera(A={a1, ..., an}) = {1} U maina({a1, ..., an}), a1'=0
 *                             maina({a1, ..., an}), a1'>0
 *
 * b. For a heterogeneous list, formed from integer numbers and list of numbers, determine the successor of a
sublist considered as a number.
 *
 * handlerb({a1, ..., an}) = handlera(a1) U handlerb({a2, ..., an}), a1
 *                                          is list and n!=1
 *
 *                           {a1} U handlerb({a2, ..., an}), a1 is not
 *                           list and n!=1
 *                           handlera(a1), a1 is list and n=1,
 *                           a1, a1 is not list and n=1
 *
 */

%appendToList(X:int, L:list, [X|L]:list)
%(i, i, o)
appendToList([], L, L).
appendToList(X, L, [X|L]).

%modifyFirst(H:int, L:list, H1:int)
%(i, i, o)
modifyFirst(H, [X|_], H1):-
    X=0 ->
     (   H=9 ->
      H1 is 0;
      H1 is H+1);
     H1 is H.

%maina(L:list, R:list)
%(i, o)
maina([9|[]], [0]).
maina([H|[]], [H1]):-H1 is H+1.
maina([H|T], R):-
    maina(T, R1),
    modifyFirst(H, R1, H1),
    appendToList(H1, R1, R).

%checkFirst(L:list, R:list)
%(i, o)
checkFirst([H|T], R):-
    H=0->
    appendToList(1, [H|T], R);
    appendToList([], [H|T], R).

%handlera(L:list, R:list)
%(i, o)
handlera([H|T], R):-
    maina([H|T], R1),
    checkFirst(R1, R).

%handlerb(L:list, R:list)
%(i, o)
handlerb([H|[]], R):-is_list(H)->handlera(H, R); appendToList(H, [], R).
handlerb([H|T], R):-
    is_list(H) ->
    handlera(H, H1),
    handlerb(T, R1),
    appendToList(H1, R1, R);
    handlerb(T, R1),
    appendToList(H, R1, R).
