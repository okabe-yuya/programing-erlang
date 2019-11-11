-module(mylist).
-export([sum/1, map/2]).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

map([H|T], F) -> [F(H)|map(T, F)];
map([], _) -> [].
