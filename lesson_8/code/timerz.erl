-module(timerz).
-export([start/2, cancel/1]).

% Example
% 1> Pid = timerz:start(25000, fun() -> io:format("hello world ~n") end).
% after 25000 seconds/1000seconds -> puts result in terminal
% 2> timerz:cancel(Pid)
% 3> cancel
start(Time, Fun) -> spawn(fun() -> timez(Time, Fun) end).

cancel(Pid) -> Pid ! cancel.

timez(Time, Fun) ->
    receive
        cancel ->
            void
    after Time ->
            Fun()
    end.
