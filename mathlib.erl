-module(mathlib).
-export([floor/1, is_prime/1]).

floor(V) when V >= 0 -> trunc(V);
floor(V) -> trunc(V - trunc(V) + 1) + trunc(V) - 1.

is_prime(X) -> case X of
					X when X =:= 2 -> true;
					X when X =:= 3 -> true;
			   		X when X rem 2 =:= 0 -> false;
			   		X when X rem 3 =:= 0 -> false;
			   		_ -> Max = floor(math:sqrt(X)), not lists:any(fun(Y) -> X rem Y =:= 0 end, lists:seq(2, Max))
			   end.
			
				
