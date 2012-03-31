-module(problem10a).
-export([solve/0, dispatcher/0]).

solve() -> Calculator1 = spawn(problem10a, dispatcher, []),
		   Calculator2 = spawn(problem10a, dispatcher, []),
		   Calculator3 = spawn(problem10a, dispatcher, []),
		   Calculator4 = spawn(problem10a, dispatcher, []),
		   Adder = spawn(calculator, calculate, [0, 4, fun(X, Y) -> X + Y end]),
		   Calculator1 ! {Adder, [2, 800000]},
		   Calculator2 ! {Adder, [800001, 1200000]},
		   Calculator3 ! {Adder, [1200001, 1600000]},
		   Calculator4 ! {Adder, [1600001, 1999999]}.

dispatcher() -> receive
					{From, [Low, High]} -> From ! {solve(Low, High)};
					_ -> io:format("Calculator received unknown message"), io:nl()
		  	 	end.

solve(Low, High) -> lists:foldl(fun(X, Sum) -> X + Sum end, 0, lists:filter(fun(X) -> mathlib:is_prime(X) =:= true end, lists:seq(Low, High))).
