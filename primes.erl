-module(primes).
-export([is_prime/2]).

% collection of primality-related functions
% (C) Josef Assad 2012, placed in the public domain

% following the rule that primes are equal to 6k±1
is_prime_shortcuts(Number) when (Number-1) rem 6 =:= 0 -> true;
is_prime_shortcuts(Number) when (Number+1) rem 6 =:= 0 -> true;
% short circuit to weed out multiples of 2 and 3
is_prime_shortcuts(Number) when Number rem 2 =:= 0     -> false;
is_prime_shortcuts(Number) when Number rem 3 =:= 0     -> false;
is_prime_shortcuts(_) -> unsure.

is_prime(simple, Number) ->
    case is_prime_shortcuts(Number) of
	true   -> true;
	false  -> false;
	unsure -> is_prime(simple, Number, lists:seq(2, trunc(math:sqrt(Number))))
    end.

is_prime(simple, Number, [Head|_]) when Number rem Head =:= 0 -> false;
is_prime(simple, Number, [_|Tail]) -> is_prime(simple, Number, Tail);
is_prime(simple, _, []) -> true.
    
