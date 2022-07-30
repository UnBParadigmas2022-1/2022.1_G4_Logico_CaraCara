:- initialization(menu).
menu:-  repeat,
	write('*** CRRRR A CRRRR ***'), nl,
	write('1. Comecar a jogar'), nl,
	write('0. Sair'), nl,
	read(X),
	option(X),
    X == 0,
	!.

option(0):- halt,!.
option(1):- jogo, nl, !.
option(_):- write('Opcao invalida'), nl, !.

jogo:-
    write('Jogando ...').

