-module(lesson2_task11).
-export([encode_modified/1]).

encode_modified(List) ->
    PackedList = pack(List, [], []),
    encode_modified_packed(PackedList, []).

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

encode_modified_packed([], Acc) ->
    lists:reverse(Acc);
encode_modified_packed([[H | T] | Rest], Acc) ->
    Length = length([H | T]),
    if
        Length > 1 -> encode_modified_packed(Rest, [{Length, H} | Acc]);
        true -> encode_modified_packed(Rest, [H | Acc])
    end.
