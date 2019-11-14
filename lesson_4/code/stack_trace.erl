-module(stack_trace).
-export([demo/0]).

% わざとerrorが出るように処理 stack traceの流れを確認したい
demo() -> 
    try 1 + "2" of
        Val -> {normal, Val}
    catch
        _:_ -> {error, erlang:get_stacktrace()}
    end.
