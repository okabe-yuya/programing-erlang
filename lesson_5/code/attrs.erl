-module(attrs).
% spec version
-vsn(1.23).
% customize infomation for attributes
-author({okb,nice_man}).
-purpose({"example"}).
-nice({"good boat"}).

-export([fac/1]).

fac(1) -> 1;
fac(N) -> N * fac(N-1).
