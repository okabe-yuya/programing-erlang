-module(stack_trace).
-export([demo/0]).

demo() -> 
    try 1 + "2" of
        Val -> {normal, Val}
    catch
        _:_ -> {error, erlang:get_stacktrace()}
    end.
