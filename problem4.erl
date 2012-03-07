-module(problem4).
-export([solve/0]).

is_palindrome([First, Second, Third, Third, Second, First]) -> true;
is_palindrome(_) -> false.

solve() -> Chiffres = lists:seq(900, 999),
		   lists:max(lists:filter(fun(Z) -> is_palindrome(Z) end, [erlang:integer_to_list(X * Y) || X <- Chiffres, Y <- Chiffres])).
