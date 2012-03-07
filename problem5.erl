-module(problem5).
-export([solve/0]).

evenly_divisible(X, Y) -> X rem Y =:= 0.

number_solves_problem(X) -> MultiplesAValider = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20], 
							not lists:any(fun(Z) -> Z =:= false end, lists:map(fun(Y) -> evenly_divisible(X, Y) end, MultiplesAValider)).

solve() -> solve(2520).

solve(X) -> case number_solves_problem(X) of
				true -> io:write(X), io:nl();
				false -> solve(X + 10)
			end.
			
