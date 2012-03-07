-module(problem3).
-export([solve/0]).

solve() -> solve(600851475143).

solve(X) -> Factor = lists:min(lists:filter(fun(Y) -> X rem Y =:= 0 end, primes:first_primes())),
		    
		    io:write(Factor), io:nl(),
		    
		    Result = X div Factor,
		    IsPrime = primes:is_prime(Result),
		    
		    if IsPrime -> io:write(Result); 
		   		true -> solve(Result)
		    end.
