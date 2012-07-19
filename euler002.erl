-module(euler002).
-export([euler002/0]).

fib_max_item(Max, ItemToBeAdded, List) when ItemToBeAdded > Max ->
    lists:reverse(List);
fib_max_item(Max, ItemToBeAdded, List) ->
    [Head | _] = List,
    fib_max_item(Max, ItemToBeAdded+Head, [ItemToBeAdded | List]).
 
euler002() ->
    lists:sum([X || X  <- fib_max_item(4000000, 1, [1]),  X rem 2 =:= 0]).
