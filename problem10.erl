-module(problem10).
-export([solve/0, calculator/0]).

solve() -> Calculator1 = spawn(problem10, calculator, []),
		   Calculator2 = spawn(problem10, calculator, []),
		   Calculator3 = spawn(problem10, calculator, []),
		   Calculator4 = spawn(problem10, calculator, []),
		   Adder = spawn(adder, adder, [0, 4]),
		   Calculator1 ! {Adder, [2, 800000]},
		   Calculator2 ! {Adder, [800001, 1200000]},
		   Calculator3 ! {Adder, [1200001, 1600000]},
		   Calculator4 ! {Adder, [1600001, 1999999]}.

calculator() -> receive
					{From, [Low, High]} -> From ! {self(), [solve(Low, High)]};
					_ -> io:format("Calculator received unknown message"), io:nl()
		  	 	end.

solve(Low, High) -> lists:foldl(fun(X, Sum) -> X + Sum end, 0, lists:filter(fun(X) -> mathlib:is_prime(X) =:= true end, lists:seq(Low, High))).
