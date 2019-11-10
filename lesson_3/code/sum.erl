-module(sum).
-export([sum/1]).

sum(L) -> sum(L, 0).

sum([], Acc) -> Acc;
sum([H|T], Acc) -> sum(T, Acc + H).
