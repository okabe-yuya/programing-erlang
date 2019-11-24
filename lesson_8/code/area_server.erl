-module(area_server).
-export([start/0, area/2]).

% Example
% 1> Pid = area_server:start().
% 2> area_server:area(Pid, {rectangle, 10, 8}).
start() -> spawn(fun loop/0).

% {送り元のPid, message}
area(Pid, What) -> rpc(Pid, What).

rpc(Pid, Request) ->
    % 送り元にresponseを送る(Pidが値を束縛しているため、receive内で異なるPidは受け取れない)
    Pid ! {self(), Request},
    receive
        {Pid, Response} ->
            Response
    end.

loop() ->
    receive
        {From, {rectangle, Width, Ht}} ->
            From ! {self(), Width * Ht},
            loop();
        {From, {circle, R}} ->
            From ! {self(), 3.14159 * R * R},
            loop();
        {From, Other} ->
            From ! {self(), {error, Other}},
            loop()
    end.
