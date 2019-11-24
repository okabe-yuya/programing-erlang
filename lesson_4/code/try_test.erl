-module(try_test).
-export([demo/0, demo2/0]).

% cause error
generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> erlang:error(a).

demo() -> [catcher(I) || I <- lists:seq(1,5)].
demo2() -> [{I, catch generate_exception(I)} || I <- lists:seq(1,5)].

catcher(I) -> 
    try generate_exception(I) of
        % user response value
        Val -> {I, normal, Val}
    catch
        throw:X -> {I, caught, thrown, X};
        exit:X -> {I, caught, exited, X};
        error:X -> {I, caught, error, X}
    end.
