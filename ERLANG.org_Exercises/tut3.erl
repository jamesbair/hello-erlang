-module(tut2).
-export([convert/2]).

convert(M, inch) ->
  M / 2.54;

convert(N, centimeter) ->
  N * 2.54.

root@05bb30a13282:/bootcamp/test# cat tut3.erl
-module(tut3).
-export([convert_length/1]).

convert_length({centimeter, X}) ->
  {inch, X / 2.54};

convert_length({inch, Y}) ->
  {centimeter, Y * 2.54}.