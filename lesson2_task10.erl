-module(lesson2_task10).
-export([encode/1]).

% Головна функція
encode(List) ->
    PackedList = pack(List, [], []),
    encode_packed(PackedList, []).

% Пакування елементів у групи
pack([], CurrentGroup, Acc) ->
    case CurrentGroup of
        [] -> lists:reverse(Acc);
        _ -> lists:reverse([CurrentGroup | Acc])
    end;
pack([H | T], [], Acc) ->
    pack(T, [H], Acc);
pack([H | T], [H | _Rest] = CurrentGroup, Acc) ->
    pack(T, [H | CurrentGroup], Acc);
pack([H | T], CurrentGroup, Acc) ->
    pack(T, [H], [CurrentGroup | Acc]).

% Кодування запакованих елементів
encode_packed([], Acc) ->
    lists:reverse(Acc);
encode_packed([[H | T] | Rest], Acc) ->
    encode_packed(Rest, [{length([H | T]), H} | Acc]).
