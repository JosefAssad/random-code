-module(expeval).
-export([list_to_num/1, tokenise/1, parse/1]).

parse(Exp) ->
    Exp.

tokenise(Exp) ->
    tokenise([], [], Exp).

list_to_num(List) ->
    list_to_num(0, 1, List).
list_to_num(Result, _, []) ->
    Result;
list_to_num(Result, Multiplier, Tisl) ->
    List = lists:reverse(Tisl),
    [Head|Tail] = List,
    list_to_num((Result+(Head*Multiplier)), (Multiplier*10), lists:reverse(Tail)).

tokenise(Result, _, []) ->
    Result;
tokenise(Result, NumHolder, [Head|Tail]) ->
    case Head of
	40 ->
	    case (length(NumHolder) > 0) of
		true ->
		    tokenise(Result++[list_to_num(NumHolder)]++[left_bracket], [], Tail);
		false ->
		    tokenise(Result++[left_bracket], [], Tail)
	    end;
	41 ->
	    tokenise(Result++[right_bracket], [], Tail);
	_ ->
	    case (47 < Head) and (Head < 58) of
		true ->
		    tokenise(Result, NumHolder++[Head-48], Tail);
		_ ->
		    problem
	    end
    end.
