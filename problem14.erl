-module(problem14).
-export([solve/0]).

solve() -> solve(400000, {0, 0}).

solve(999999, {MaxNumber, _}) -> MaxNumber;
solve(CurrentNumber, {MaxNumber, MaxNumberOfFactors}) -> NumberOfFactors = get_sequence_length(CurrentNumber),
						case NumberOfFactors > MaxNumberOfFactors of 
							true -> solve(CurrentNumber + 1, {CurrentNumber, NumberOfFactors});
							false -> solve(CurrentNumber + 1, {MaxNumber, MaxNumberOfFactors})
						end.

get_sequence_length(N) -> get_sequence_length(N, 0).
get_sequence_length(1, Count) -> Count + 1;
get_sequence_length(N, Count) when N rem 2 == 0 -> get_sequence_length(N div 2, Count + 1);
get_sequence_length(N, Count) -> get_sequence_length(3 * N + 1, Count + 1).
