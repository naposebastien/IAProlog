/*
Napoleon Sebastien et Andrieux Romain

Mini projet d'intelligence artificiel.
*/

/*
Personne(s) à l'origine : Napoleon Sebastien et Andrieux Romain 
Date de la modification : 19 Janvier 2019.
*/
getIntru(Gs, Intru) :-
    findall(C, numberOfNull(Gs, C), Lc),
    getMin(Lc, I),
    nth0(I, Gs, Intru).


/*
Personne(s) à l'origine : Napoleon Sebastien et Andrieux Romain.
Date de la modification : 19 Janvier 2019.
*/
numberOfNull(Gs, C) :-
    select(_, Gs, R),
    compareTwoTreeElements(R, Arbre),
    countOfNull(Arbre, C).

/*
Personne(s) à l'origine : Napoleon Sebastien et Andrieux Romain.
Date de la modification : 12 Janvier 2019.
*/
countOfNull(leaf(Size, Color, Shape), R) :-
    checkIfNull(Size, S),
    checkIfNull(Color, C),
    checkIfNull(Shape, Sh),
    R is S+C+Sh.
   
countOfNull(node(Alignement, Left, Right), X) :-
    countOfNull(Left, Lc),
    countOfNull(Right, Rc),
    checkIfNull(Alignement, A),
    X is Lc+Rc+A.
/*
Personne(s) à l'origine : Napoleon Sebastien et Andrieux Romain.
Date de la modification : 12 Janvier 2019.
*/

supp_colour(C,Cbis,R):- colour(C), colour(Cbis), ( C == Cbis -> R = C ; R = null).
supp_shape(S,Sh,R):- shape(S), shape(Sh), ( S == Sh -> R = S ; R = null).
supp_size(S,Si,R):- size(S), size(Si), ( S == Si -> R = S ; R = null).
supp_align(A,Al,R):- alignment(A),alignment(Al), ( A == Al -> R = A ; R = null).

/*
Personne(s) à l'origine : Napoleon Sebastien et Andrieux Romain.
Dates de modifications : 12 et 16 Janvier 2019.
*/
compareTwoTreeElements(leaf(_, _, _), null, leaf(null, null, null)).
compareTwoTreeElements(null, leaf(F, S, T), leaf(F, S, T)).

compareTwoTreeElements(leaf(SizeFirst, ColorFirst, ShapeFirst), leaf(SizeSecond, ColorSecond, ShapeSecond), leaf(Size, Color, Shape)) :-
    supp_size(SizeFirst, SizeSecond, Size),
    supp_colour(ColorFirst, ColorSecond, Color),
    supp_shape(ShapeFirst, ShapeSecond, Shape).

compareTwoTreeElements(node(_, _, _), null, node(null, null, null)).
compareTwoTreeElements(null, node(A, B, C), node(A, B, C)).

compareTwoTreeElements(node(AlignementFirst, LeftFirst, RightFirst), node(AlignementSecond, LeftSecond, RightSecond), node(Alignement, Left, Right)) :-
    supp_align(AlignementFirst, AlignementSecond, Alignement),
    compareTwoTreeElements(LeftFirst, LeftSecond, Left),
    compareTwoTreeElements(RightFirst, RightSecond, Right).

compareTwoTreeElements([], null).

compareTwoTreeElements([T|Tx], R) :-
    compareTwoTreeElements(Tx, N),
    compareTwoTreeElements(N, T, R).

/*
Personne(s) à l'origine : Andrieux Romain.
Date de la modification : 12 janvier 2019.
*/
checkIfNull(null, 1).
checkIfNull(F, 0) :-
    F\==null.

/*
Personne(s) à l'origine : Sebastien Napoleon 19/01.
Date de la modification : 19 Janvier 2019.
*/
getMin(F, S) :-
    sort(F, T),
    nth0(0, T, E),
    cp(F, E, S).

/*
Personne(s) à l'origine : Napoleon Sebastien et Andrieux Romain.
Date de la modification : 19 janvier 2019.
*/
cp(G, E, I) :-
    nth0(I, G, T),
    T==E.
