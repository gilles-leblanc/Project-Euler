-module(problem7).
-export([solve/0]).

floor(V) when V >= 0 -> trunc(V);
floor(V) -> trunc(V - trunc(V) + 1) + trunc(V) - 1.

is_prime(X) -> Max = floor(math:sqrt(X)),
			   not lists:any(fun(Y) -> X rem Y =:= 0 end, lists:seq(2, Max)).

solve() -> solve(3, 0).

solve(Solution, 10000) -> io:write(Solution - 2), io:nl();

solve(ChiffreATester, Accumulateur) -> case is_prime(ChiffreATester) of
											true -> solve(ChiffreATester + 2, Accumulateur + 1);
											false -> solve(ChiffreATester + 2, Accumulateur)
									   end.
		   
