-module(problem9).
-export([solve/0]).

solve() -> [A * B * C || A <- lists:seq(1, 349), 
						 B <- lists:seq(A + 1, 499), 
						 C <- lists:seq(B + 1, 1000), 
						 A + B + C =:= 1000,
						 A*A + B*B =:= C*C].

