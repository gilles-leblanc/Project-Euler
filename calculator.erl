-module(calculator).
-export([calculate/3]).

% calculate(Seed, NumberOfProcesses, Function)

calculate(Result, 0, _) -> io:format("Final Result: ~p ~n", [Result]);
 
calculate(Temp, NumberOfProcesses, Function) ->
			receive
				{Value} ->
					IntermediateResult = Function(Temp, Value),
					calculate(IntermediateResult, NumberOfProcesses - 1, Function)
			end.

