/*
 * PROLOG 3: Se da o lista de numere intregi. Sa se inlocuiasca
 * elementele de pe pozitiile pare cu diferenta dintre valoarea lor si
 * valoarea minima a listei.
 *
 * appendToList(x, {a1, ..., an})={x, a1, ..., an}
 *
 * findmin({a1, a2, ..., an}) = a1, a1<findmin({a2, ..., an}), n!=1
 *                              findmin({a2, ..., an}), a1>findmin({a2,
 *                              ..., an}), n!=1
 *                              an, n==1
 *
 * replaceEven({a1, ..., an})= {ai} U replaceEven({a2, ..., an}), i%2==1
 *                             {ai-findmin({a1,...,an})} U
 *                             replaceEven({a2, ..., an}), i%2==0
 *                             {ai}, n==1, i%2==1
 *                             {ai-findmin({a1,...,an})}, n==1, i%2==0
 *
 *
 */

%appendToList(i:int, l:list, r:list)
%(i, i, o)
appendToList(H, L, [H|L]).
appendToList([], L, L).

%findmin(l:list, i:int)
%(i, o)
findmin([H|[]], H).
findmin([H|T], H):-
    findmin(T, X),
    H=<X.
findmin([H|T], X):-
    findmin(T, X),
    H>X.

%appendToList(l:list, i:int, m:int, r:list)
%(i, i, i, o)
replaceEven([H|[]], I, M, R):-
    C is mod(I, 2),
    C=0->
    Z is H-M,
    appendToList(Z, [], R);
    appendToList(H, [], R).
replaceEven([H|T], I, M, R):-
    C is mod(I, 2),
    C=0->
    I2 is I+1,
    replaceEven(T, I2, M, R1),
    Z is H-M,
    appendToList(Z, R1, R);
    I2 is I+1,
    replaceEven(T, I2, M, R1),
    appendToList(H, R1, R).

%main(l:list, r:list)
%(i, o)
main([], []).
main(L, R):-
    findmin(L, C),
    replaceEven(L, 1, C, R).

/*
 * nota5({a1, a2, ..., an}) = {99, a1} U nota5({a2, ..., an}), n!=1 and
 *                            a1 odd
 *                            {a1} U nota5({a2, ..., an}), n!=1 and a1
 *                            even
 *                            {99, an}, n==1 and an odd
 *                            {an}, n==1 and an even
 *
 */

%nota5(L:list, R:list)
%(i, o)
nota5([H|[]], R):-
    C is mod(H, 2),
    C=1->
    appendToList(H, [], R2),
    appendToList(99, R2, R);
    appendToList(H, [], R).
nota5([H|T], R):-
    C is mod(H, 2),
    C=1->
    nota5(T, R1),
    appendToList(H, R1, R2),
    appendToList(99, R2, R);
    nota5(T, R1),
    appendToList(H, R1, R).
