:- initialization(menu).

menu:-  repeat,	
	consult('./personagens.pl'),
	write('*** Cara a Cara ***'), nl,
	write('1. Comecar a jogar'), nl,
	write('2. Tutorial'), nl,
	write('0. Sair'), nl,
	read(X),
	option(X),
    X == 0,
	!.

option(0):- halt, !.
option(1):- introducao,!.
option(2):- tutorial, !.
option(_):- write('Opcao invalida'), nl, !.

% criar uma lista das pessoas
% sortear um personagem da lista

tutorial:-
	nl, write('Bem-vindo ao tutorial do jogo Cara a Cara'), nl,
	!.


introducao:-
	nl, write('Seja bem-vindo ao jogo Cara a Cara.'), nl, write('Sugiro que veja o tutorial antes de jogarmos (basta apertar 2).'), nl,
	nl, write('Caso ja saiba como funciona, vamos la!'), nl, write('Sorteamos algum dos 40 personagens e voce precisa adivinhar quem. 
	Para isso, nos faca algumas das seguintes perguntas digitando o numero correspondente da pergunta (1, 2, etc...):'), nl,
	consult('./personagens.pl'),
	escolherPersonagem,
	findall(P, pessoa(P), L),
	jogo(L), !.


escolherPersonagem() :- 
	findall(P, pessoa(P), Pessoas),

	% sortear um personagem da lista

	% Acessa tamanho da lista
	length(Pessoas, Tamanho),

	% Sorteia um numero entre 1 e Tamanho
	random(0, Tamanho, Indice),

	% Acessa o personagem sorteado
	nth0(Indice, Pessoas, Escolhido),

	% Printa o personagem sorteado
	nl, write('O personagem sorteado foi: '), write(Escolhido), nl,
	b_setval(personagem, Escolhido), !.

jogo([]).
jogo(L):-
	% printar os personagens atuais

	nl, write('Personagens atuais: '), 
	write(L), nl,

	%inter(T, L, Listaatual),

	% printar o personagem sorteado
	b_getval(personagem, Escolhido),
	nl, write('O personagem sorteado foi: '), write(Escolhido), nl,

	nl, write('0 - Chutar nome'), nl,
	nl, write('1 - O personagem escolhido tem cabelo?'),
	nl, write('2 - O personagem escolhido usa brinco?'),
	nl, write('3 - O personagem escolhido eh uma mulher?'),
	nl, write('4 - O personagem escolhido eh um homem?'),
	nl, write('5 - A cor do cabelo do personagem eh castanha?'),
	nl, write('6 - A cor do cabelo do personagem eh loira?'),
	nl, write('7 - A cor do cabelo do personagem eh preta?'),
	nl, write('8 - A cor do cabelo do personagem eh branca?'),
	nl, write('9 - A cor do cabelo do personagem eh ruiva?'),
	nl, write('10 - O personagem escolhido usa oculos?'),
	nl, write('11 - O personagem escolhido usa chapeu?'),
	nl, write('12 - O personagem escolhido usa boina?'),
	nl, write('13 - O personagem escolhido usa bone?'),
	nl, write('14 - O personagem escolhido tem bigode?'),
	nl, write('15 - O personagem escolhido tem barba?'),
	nl, write('16 - O personagem escolhido tem cor de pele branca?'),
	nl, write('17 - O personagem escolhido tem cor de pele preta?'), nl,
	read(Y),
	optionJogo(Y, L), 
	%Y == 0,
	!.


%optionJogo(_, []):-
%	nl, write('Opcao invalida de jogo'), nl, !.

%optionJogo(0, L):- chutarNome(L),!.
optionJogo(1, L):- cabeloExiste(L), !.
optionJogo(2, L):- brincoTem(L),  !.
%optionJogo(3, L):- sexoMulher(L), !.
%optionJogo(4, L):- sexoHomem(L), !.
%optionJogo(5, L):- cabeloCastanho(L), !.
%optionJogo(6, L):- cabeloLoiro(L), !.
%optionJogo(7, L):- cabeloPreto(L), !.
%optionJogo(8, L):- cabeloBranco(L), !.
%optionJogo(9, L):- cabeloRuivo(L), !.
%optionJogo(10, L):- oculosUsa(L), !.
%optionJogo(11, L):- chapeuUsa(L), !.
%optionJogo(12, L):- boinaUsa(L), !.
%optionJogo(13, L):- boneUsa(L), !.
%optionJogo(14, L):- bigodeTem(L), !.
%optionJogo(15, L):- barbaTem(L), !.
%optionJogo(16, L):- corBranca(L), !.
%optionJogo(17, L):- corNegra(L), !.



inter([], _, []).
inter([H1|T1], L2, [H1|Res]) :-
    member(H1, L2),
    inter(T1, L2, Res).
inter([_|T1], L2, Res) :-
    inter(T1, L2, Res).


chutarNome:-
	nl, write('Digite o nome do personagem: '),
	read(Nome),
	b_getval(personagem, Escolhido),
	% verificar se o nome eh o mesmo do personagem sorteado (NAO FUNCIONA)
	nome(Escolhido, Nome),
	!.


cabeloExiste(L):-

	b_getval(personagem, Escolhido),

	cabelo(Y, Escolhido),
	nl, write(Y), nl,
	findall(X, cabelo(Y, X), L1),

	inter(L, L1, L2),

	nl, write('Tem cabelo: '), nl,
	nl, write(L1),

	jogo(L2), !.

brincoTem(L):-

	b_getval(personagem, Escolhido),

	brinco(Y, Escolhido),
	nl, write(Y), nl,
	findall(X, brinco(Y, X), L1),

	inter(L, L1, L2),

	nl, write('Tem brinco: '), nl,
	nl, write(L1),

	jogo(L2), !.


sexoMulher(L):-

	jogo, !.

sexoHomem(L):-

	jogo, !.

cabeloCastanho(L):-

	jogo, !.

cabeloLoiro(L):-

	jogo, !.

cabeloPreto(L):-

	jogo, !.

cabeloBranco(L):-

	jogo, !.

cabeloRuivo(L):-

	jogo, !.

oculosUsa(L):-

	jogo, !.

chapeuUsa(L):-

	jogo, !.

boinaUsa(L):-

	jogo, !.

boneUsa(L):-

	jogo, !.

bigodeTem(L):-

	jogo, !.

barbaTem(L):-

	jogo, !.

corBranca(L):-

	jogo, !.

corNegra(L):-

	jogo, !.



