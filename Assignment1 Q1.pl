sister(mary, catherine).
brother(john, simone).

married(john, mary).
marriedYear(john, 2010).
marriedYear(mary, 2010).

mother(mary, johnny).
born(johnny, 2012).
mother(mary, peter).
born(peter, 2015).

married(josh, catherine).
marriedYear(josh, 2011).
marriedYear(catherine, 2011).
mother(catherine, william).
born(william, 2012).

married(simone, kate).
marriedYear(simone, 2011).
marriedYear(kate, 2011).
mother(kate, betty).
born(betty, 2011).

parent(X, Y) :- mother(X, Y).
parent(X, Y) :- mother(Z, Y), married(X, Z).


siblings(X ,Y) :- parent(Z, X), parent(Z, Y).
siblings(X, Y) :- sister(X, Y).
siblings(X, Y) :- brother(X, Y).

cousins(X, Y) :- siblings(A,B),parent(B, X),parent(A, Y).
cousins(X, Y) :- siblings(A,B),parent(B, Y),parent(A, X).
