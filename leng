mylength([],0).
mylength([_|Tail],Len):- mylength(Tail,LTail), Len is LTail+1.

average(List,G):- length(List,Len), Len >0, sum_list(List,S), G is S/ Len.


delete([],Elem,[]).
delete([E|Tail],E,Output):-delete(Tail,E,Tail).
delete([X|Tail],E,Output):-delete(Tail,E,TempList),append(Tail,TempList,Output).

mynth([Elem|_],0,Elem).
mynth([_|T],Index,Elem):-NIndex is Index-1,mynth(T,NIndex,Elem).

mymaxlist([H|T],Max):-mmax(T,H,Max).
max(A,B,Max):-A>b,Max is A.
max(A,B,Max):- A<B, Max is B.
max(N,N,Max):Max is N.
mmax([],Max,Max).
mmax([H|T],TempMax,Max):- max(H,TempMax,NewMax),mmax(T,NewMax,Max).
