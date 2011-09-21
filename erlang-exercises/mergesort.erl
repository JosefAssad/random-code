%% Copyright Josef Assad 2011
%%
%% This is the solution to exercise 3.6 of Cesarini's book Programming Erlang

-module(mergesort).
-export([mergesort/1]).

merge(Left, Right) ->
    merge([], Left, Right).

merge(Result, [], Right) ->
    Result ++ Right;
merge(Result, Left, []) ->
    Result ++ Left;
merge(Result, [LHead|LTail], [RHead|RTail]) ->
    case LHead > RHead of
	true ->
	    merge(Result++[RHead], [LHead|LTail], RTail);
	false ->
	    merge(Result++[LHead], LTail, [RHead|RTail])
    end.

mergesort_spliton(List) ->
    case length(List) rem 2 of
	0 ->
	    trunc(length(List) /2);
	1 ->
	    trunc((length(List) - 1) / 2)
    end.

mergesort(List) ->
    ListLength = length(List),
    case ListLength < 2 of
	true ->
	    List;
	false ->
	    {Left, Right} = lists:split(mergesort_spliton(List), List),
	    merge(mergesort(Left), mergesort(Right))
    end.
