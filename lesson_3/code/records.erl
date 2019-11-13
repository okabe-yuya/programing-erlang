-module(records).
-export([test/1]).
-include("records.hrl").

test(#todo{status=S, who=W}) -> string:concat(S, W).
