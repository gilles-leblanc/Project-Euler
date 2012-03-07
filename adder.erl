-module(adder).
-export([adder/2]).

adder(Sum, 0) -> io:format("Final Sum: ~p ~n", [Sum]);
 
adder(Sum, NumberOfProcesses) ->
				receive
					{From, [Value]} ->
						NewSum = Sum + Value,
						adder(NewSum, NumberOfProcesses - 1)
				end.

