-module(shop2).
-export([total/1]).
-import(mylist, [map/2, sum/1]).

% recursive function -> map
total(L) -> sum(map(L, fun({What, N}) -> shop:cost(What) * N end)).
