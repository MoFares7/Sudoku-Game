% sudoku

% cell(Value,Row,Col).

size(4,4).

cell(3,1,1).
cell(4,1,2).
cell(2,1,3).
cell(1,1,4).

cell(2,2,1).
cell(1,2,2).
cell(4,2,3).
cell(3,2,4).

cell(1,3,1).
cell(2,3,2).
cell(3,3,3).
cell(4,3,4).

cell(4,4,1).
cell(3,4,2).
cell(1,4,3).
cell(2,4,4).


% 1.  collect rows

collect(Row,List):- findall(Value,cell(Value,Row,_),List) .


%--------------------------------------------
% 2.a. no emply cells in a row


notempty(R) :- collect(R,L) , length(L,S), size(S,S).

%---------------------------------------------
% 2.b. no repeated numbers in row

norepeat(R) :-  collect(R,L) , checkrepeat(L).

checkrepeat([H|T]) :- not(member(H,T)) , checkrepeat(T).
checkrepeat([]).

%---------------------------------------------
% 2.c. two rows are unique.

unique(R1,R2):- collect(R1,L1), collect(R2,L2), not(checkunique(L1,L2)).

checkunique([H1|T1],[H2|T2]) :- H1 = H2 , checkunique(T1,T2). 
checkunique([],[]).


%---------------------------------------------
% 2.d a row contains the numbers from 1 to 4.

contain(R) :- collect(R,L) ,size(S,S), checknum(L,S).

checknum(L,S) :-S>0,!, member(S,L),S1 is S - 1 ,checknum(L,S1).
checknum(_,0).




print_Sudoku:-size(S,S),print_Sudoku(S).
print_Sudoku(S):-S>0,collect(S,L),S1 is S-1,print_Sudoku(S1),print(L),nl.
print_Sudoku(0).

noemptyall(R) :-R>0, notempty(R), R1 is R-1, noemptyall(R1). 
noemptyall(0).

norepeatall(R) :-R>0, norepeat(R), R1 is R-1,norepeatall(R1).
norepeatall(0).

containall(R):- R>0  , contain(R) ,  R1 is R-1, containall(R1),!.
containall(0).

check(0,1).
check(R1,R2) :-(R1>0 -> RR1 is R1-1,unique(RR1,R2), check(RR1,R2);R2>1, RR1 is R2 -2 ,RR2 is R2-1 , unique(RR1,RR2) , check(RR1,RR2)).
uniqueall(R) :-  check(R,R),!. 

allcondition:-size(R,R) ,noemptyall(R), norepeatall(R) , containall(R),uniqueall(R).


