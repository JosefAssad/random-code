-module('euler-002').
-export([fib/2]).

fib(num_items, N) ->
    fib_num_items(N, 1, [1, 1]);
fib(max_item, M) ->
    fib_max_item(M, 1, [1]).

fib_max_item(Max, ItemToBeAdded, List) when ItemToBeAdded > Max ->
    lists:reverse(List);
fib_max_item(Max, ItemToBeAdded, List) ->
    [Head | _] = List,
    fib_max_item(Max, ItemToBeAdded+Head, [ItemToBeAdded | List]).

fib_num_items(N, N, List) ->
    lists:reverse(List);
fib_num_items(N, Counter, List) ->
    [Head1 | Tail] = List,
    [Head2 | _]    = Tail,
    fib_num_items(N, Counter+1, [Head1+Head2 | List]).
