-module(problem1).
-export([solve/0]).

solve() -> lists:foldl(fun(X, Sum) -> X + Sum end, 0, [Y || Y <- lists:seq(1, 999), Y rem 3 =:= 0 orelse Y rem 5 =:= 0]).
