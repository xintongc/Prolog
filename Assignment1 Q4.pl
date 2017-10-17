node(a).
node(b).
node(c).
node(d).
node(e).
node(f).
node(g).
node(h).
edge(a,b).
edge(b,c).
edge(c,a).
edge(c,d).
edge(c,e).
edge(d,e).
edge(d,h).
edge(e,g).
edge(g,e).
edge(e,f).
edge(f,g).

parent(X,Y):-edge(X,Y).

ancestor(X,Y):-path(X,Y, _).

child(X,Y):-parent(Y,X).

path(X,Y,Path) :- travel(X,Y,[X],Q), reverse(Q,Path).

travel(X,Y,P,[Y|P]) :- edge(X,Y).

travel(X,Y,Visited,Path) :-
       edge(X,Z),           
       Z \== Y,
       \+member(Z,Visited),
       travel(Z,Y,[Z|Visited],Path).  


length_of_path(X,Y, Z):-path(X,Y,Path), length(Path, L), Z is L-1.
       
connected(X,Y) :- path(X,Y,_) ; path(Y,X,_).

undirected_edge(X,Y):-edge(X,Y);edge(Y,X).

undirected_path(X,Y,Path):- node(X),node(Y),
       travel_undirected(X,Y,[X],Q), 
       reverse(Q,Path).

travel_undirected(X,Y,P,[Y|P]) :- undirected_edge(X,Y).
travel_undirected(X,Y,Visited,Path) :-
       undirected_edge(X,Z),           
       Z \== Y,
       \+member(Z,Visited),
       travel_undirected(Z,Y,[Z|Visited],Path).  
