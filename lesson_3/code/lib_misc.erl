-module(lib_misc).
-export([for/3, qsort/1, pythag/1]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I)|for(I+1, Max, F)].

qsort([]) -> [];
qsort([Pivot|T]) -> qsort([X || X <- T, X < Pivot]) ++ [Pivot] ++ qsort([X || X <- T, X >= Pivot]).

pythag(N) -> [{A, B, C} ||
              A <- lists:seq(1, N),
              B <- lists:seq(1, N),
              C <- lists:seq(1, N),
              A+B+C =< N,
              A*A + B*B =:= C*C
            ].


% permの動き方について
% L = [1,2,3,4]の場合
% [[1,2,3,4 | 2
perms([]) -> [ [] ];
perms(L) -> [ [H|T] || H <- L, T <- perms(L--[H])].
