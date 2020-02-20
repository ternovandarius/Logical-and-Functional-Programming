/*
 * A player wants to choose the predictions for 4 games. The predictions can be 1, X, 2. Write a predicate
 to generate all possible variants considering that: last prediction can’t be 2 and no more than two
 possible predictions X.
 *
 * Implementation may generate unwanted additional results due to forgetting to use cut operator (oops!).
 *
 *
 *  generate([1, 2, x], S, N) = {1}, N=0 or {x}, N=1, if S==1
 *                              ({1} or {2}) U generate([1, 2, x], S-1,
 *                              N), if N==2
 *                              {x} U generate([1, 2, x], S-1, N+1), if
 *                              N<2
 *
 *  handler()=U generate([1, 2, x], 4, N)
 */


%generate(L:list, R:list, S:int, N:int)
%generate(i, o, i, o)
generate([1, 2, x], [1|T], S, N):-
    S > 1,
    S1 is S-1,
    generate([1, 2, x], T, S1, N).
generate([1, 2, x], [x|T], S, N):-
    S > 1,
    S1 is S-1,
    generate([1, 2, x], T, S1, N1),
    N1 =< 1,
    N is N1+1.
generate([1, 2, x], [2|T], S, N):-
    S =< 4,
    S > 1,
    S1 is S-1,
    generate([1, 2, x], T, S1, N).
generate([1, 2, x], [1], 1, 0).
generate([1, 2, x], [x], 1, 1).

%handler(R:list)
%handler(o)
handler(RR):-
    findall(R, generate([1, 2, x], R, 4, _), RR).
