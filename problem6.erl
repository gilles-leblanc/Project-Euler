-module(problem6).
-export([solve/0]).

nombres() -> lists:seq(1, 100).

sum_of_squares() -> lists:foldl(fun(X, Sum) -> X * X + Sum end, 0, nombres()).

square_of_sum() -> Sum = lists:foldl(fun(X, Sum) -> X + Sum end, 0, nombres()),
				   Sum * Sum.

solve() -> square_of_sum() - sum_of_squares().
