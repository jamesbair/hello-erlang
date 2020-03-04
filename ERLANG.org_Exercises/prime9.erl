-module(prime9).
 -export([sumprimes/1]).

 sumprimes(N) -> sumprimes(N,[2],[2],2,3).

 sumprimes(N,[H|T],L,Max,Try) when (Max<N) andalso (Try rem H /= 0)
     -> sumprimes(N, T,L, Max, Try);
 sumprimes(N,[H|T],L,Max,Try) when (Max<N) andalso (Try rem H == 0)
     -> sumprimes(N, L,L, Max, Try+1);
 sumprimes(N,[2],L,Max,Try) when (Try rem 2 /= 0)
     -> sumprimes(N,[],L,Max,Try);
 sumprimes(N,[2],L,Max,Try) when (Try rem 2 == 0)
     -> sumprimes(N,L,L,Max,Try+1);
 sumprimes(N,[],L,Max,Try) when (Max<N)
     -> sumprimes(N,lists:append([Try],L),lists:append([Try],L),Try,Try+1);
 sumprimes(N,L,[H|T],Max,Try) when (Max >= N)
     -> lists:sum(T).