-module(lib_misc).
-export([on_exit/2, pid_res/0]).

% Example
% 1> Pid = lib_misc:pid_res().
% 2> lib_misc:on_exit(Pid, fun(Why) -> io:format(" ~p died with:~p~n", [Pid, Why]).
% 3> Pid ! hello.
% <0.84.0> died with:{badarg,
% [{erlang,list_to_atom,[hello],[]},
% {lib_misc,f,0,[{file,"lib_misc.erl"},{line,16}]}]}
% hello

on_exit(Pid, Fun) ->
    spawn(fun() ->
                  process_flag(trap_exit, true),
                  link(Pid),
                  receive
                      {'EXIT', Pid, Why} ->
                          Fun(Why)
                  end
          end).

f() ->
    receive
        X -> list_to_atom(X)
    end.

pid_res() ->
    spawn(fun() -> f() end).
