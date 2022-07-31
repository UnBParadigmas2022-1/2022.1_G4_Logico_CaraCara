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
	jogo, !.

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


jogo():-
	% printar os personagens atuais

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
	optionJogo(Y), 
	Y == 0,
	!.

optionJogo(0):- chutarNome,!.
optionJogo(1):- cabeloExiste, !.
optionJogo(2):- brincoTem, !.
optionJogo(3):- sexoMulher, !.
optionJogo(4):- sexoHomem, !.
optionJogo(5):- cabeloCastanho, !.
optionJogo(6):- cabeloLoiro, !.
optionJogo(7):- cabeloPreto, !.
optionJogo(8):- cabeloBranco, !.
optionJogo(9):- cabeloRuivo, !.
optionJogo(10):- oculosUsa, !.
optionJogo(11):- chapeuUsa, !.
optionJogo(12):- boinaUsa, !.
optionJogo(13):- boneUsa, !.
optionJogo(14):- bigodeTem, !.
optionJogo(15):- barbaTem, !.
optionJogo(16):- corBranca, !.
optionJogo(17):- corNegra, !.

chutarNome:-
	nl, write('Digite o nome do personagem: '),
	read(Nome),
	b_getval(personagem, Escolhido),
	% verificar se o nome eh o mesmo do personagem sorteado (NAO FUNCIONA)
	nome(Escolhido, Nome),
	!.

cabeloExiste:-

	% ifThenElse(cabelo(True, personagemEscolhido), lista_pessoas = [cabelo(True, X)], lista_pessoas = [cabelo(False, X)])

	findall(X, cabelo(true,X), L),
	nl, write('Tem cabelo: '), nl,
	nl, write(L),

	jogo, !.

brincoTem:-

	jogo, !.

sexoMulher:-

	jogo, !.

sexoHomem:-

	jogo, !.

cabeloCastanho:-

	jogo, !.

cabeloLoiro:-

	jogo, !.

cabeloPreto:-

	jogo, !.

cabeloBranco:-

	jogo, !.

cabeloRuivo:-

	jogo, !.

oculosUsa:-

	jogo, !.

chapeuUsa:-

	jogo, !.

boinaUsa:-

	jogo, !.

boneUsa:-

	jogo, !.

bigodeTem:-

	jogo, !.

barbaTem:-

	jogo, !.

corBranca:-

	jogo, !.

corNegra:-

	jogo, !.



