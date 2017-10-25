and(0,0,0).
and(0,1,0).
and(1,0,0).
and(1,1,1).

or(0,0,0).
or(0,1,1).
or(1,0,1).
or(1,1,1).

inv(0,1).
inv(1,0).

nand(0,0,1).
nand(0,1,1).
nand(1,0,1).
nand(1,1,0).

nor(0,0,1).
nor(0,1,0).
nor(1,0,0).
nor(1,1,0).

xor(0,0,0).
xor(0,1,1).
xor(1,0,1).
xor(1,1,0).

circuit(A,B,C,Out):-inv(C,Cinv),and(B, Cinv,BC),or(BC,A,Out).


aexample4(a,b,c,d,e,f,g,out):-inv(a,out1),and(b,c,out2),nand(out1,out2,outf1),or(e,f,ef),nand(outf1,ef,outf2),xor(ef,g,efg),or(efg,outf1).


first_element( F, [F|_] ).


last_element( L,[L]).
last_element(L, [_|R]) :- last_element(L,R).


list_length([],0).
list_length([_|T], R) :-list_length(T, Num), R is Num+1.

_ is anonymous  variable
定义了的variable，必须使用第二次，否则就用anonymous  variable



append_list([],L,L).
append_lis([H|T],L,[H|R]):-append_list(T,L,R).



prefix(P,L) means P is the prefix of L. ex. 


prefix(P,L):-append(p,_,L).
suffix(S,L):-append(_,S,L).


S is sublist of L (L1,L2,newlist)
sublist(S,L):-append(_,S,P),append(P,_,L).

reverse([],[]).
reverse([H|T],R):- reverse(T, R1), append_list (R1, [H], R).


X is a nth element in list.
nth_element(0,X,[X|_]).
nth_element(N,R,[_|T]):-M is N-1, nth_element(M,R,T).


//insert_element(E, L, NL):- append_list(E, L, NL).
insert_element(R,L,[R|L]).


insert_nth(R,0,L,[R|L]).
insert_nth(R,N,[H|L],[H|NL]):- M is N-1, insert_nth(R, M, L,NL).


delete_nth(0,[_|T],T).
delete_nth(N,[H|L],[H|NL]):- M is N-1, delete_nth(M, L, NL).

Delete all occurrences of element X in the list L to generate a new list.
delete_element(_,[],[]).
delete_element(X,[X|T],R):-delete_element(X,T,R).
delete_element(X,[Y|T],[Y|T1]):X\=Y, delete_element(X,T,T1).


gcd(X,Y,G) :- G is the greatest common divisor of X and Y.

gcd(X,0,X) :- X > 0.
gcd(X,Y,G) :- Y > 0, Z is X mod Y, gcd(Y,Z,G).

Write down a Prolog procedure third-to-last to find the third-to-last element from a list
third-to-last(X,[X,Y,_]).
third-to-last(X,[Y|Ys]) :- third-to-last(X,Ys).


range(I, K, L) :- I <= K, and L is the list containing all consecutive integers from I to K
range (1,4,X) =>   X=[1,2,3,4]

range(I,I,[I]).
range(I,K,[I|L]) :- I < K, I1 is I + 1, range(I1,K,L).


Contain(X, [X|_]).
Contain(X, [_|T]) :- contain(X,T).


Takes two lists as arguments, and succeeds if the first list is twice the size of the second list.
a2b([],[]).
a2b( [_,_|Ta], [_|Tb] ) :- a2b(Ta, Tb).



Write a code to determine if a list contains negative number or not.
neg([X|Y]):- X<0.
neg([X|Y]):- X>=0, neg(Y).
