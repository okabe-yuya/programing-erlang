-module(sample).
-export([start/0]).

start() -> main(10).
main(0) -> 0;
main(Num) -> Num * 2 + main(Num - 1).
