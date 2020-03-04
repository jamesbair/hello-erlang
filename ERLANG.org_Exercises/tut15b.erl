-module(tut15b).

-export([start/0, zing2/2, pong/0]).

 zing2(0, Pong_PID) ->
    Pong_PID ! finished,
    io:format("ping finished~n", []);

 zing2(N, Pong_PID) ->
    Pong_PID ! {zing2, self()},
    receive
        pong ->
            io:format("Ping received pong~n", [])
    end,
    zing2(N - 1, Pong_PID).

 pong() ->
    receive
        finished ->
            io:format("Pong finished~n", []);
        {ping2, Ping_PID} ->
            io:format("Pong received ping~n", []),
            Ping_PID ! pong,
            pong()
    end.

 start() ->
    Pong_PID = spawn(tut15, pong, []),
    spawn(tut15, ping, [3, Pong_PID]).