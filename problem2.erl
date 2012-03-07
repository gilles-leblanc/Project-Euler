-module(problem2).
-export([solve/0]).

fib(0) -> 1;
fib(1) -> 1;
fib(N) -> fib(N - 1) + fib(N - 2).

solve() -> lists:foldl(fun(X, Sum) -> X + Sum end, 0, lists:filter(fun(Z) -> Z rem 2 =:= 0 end, [fib(Y) || Y <- lists:seq(1, 33)])).
