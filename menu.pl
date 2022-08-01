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

	nl, write('Bem-vindo ao tutorial do jogo cara-a-cara'), nl,
	nl, write('O jogo cara-a-cara tem como objetivo adivinhar uma pessoa de acordo com suas características'),nl,
	nl, write('O jogo vai sortear aleaórioamente uma pessoa e você tem que adivinhar com base nas características dela'),nl,
	nl, write('Você tem direito a cinco perguntas e o jogo vai atualizando a lista de nomes de acordo com as suas perguntas, então pense bem na hora de escolher elas'),nl,
	nl, write('Quando tiver certeza da sua resposta, você tem até dois palpites para descobrir a pessoa sorteada'),nl,
	nl, write('Agora que você já sabe como jogar, boa sorte'),nl,
	menututorial,
	!.

menututorial:- 
	nl, write('1. Começar a jogar'),nl,
	write('2. Voltar ao menu principal'),nl,
	read(Z),
	opcao(Z),
	!.

	opcao(1):- introducao, !.
	opcao(2):- menu, !.

introducao:-
	% Acessa tamanho da lista
	length(Pessoas, TamanhoLista),
	consult('./personagens.pl'),
	nl, write('Seja bem-vindo ao jogo Cara a Cara.'), nl, write('Sugiro que veja o tutorial antes de jogarmos (basta apertar 2). '), 
	write('Caso ja saiba como funciona, vamos la!'), nl, nl, write('-> Sorteamos algum dos 34 personagens e voce precisa adivinhar quem. Para isso, nos faca algumas das seguintes perguntas 
digitando o numero correspondente da pergunta (1, 2, etc...):'), nl,
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
	b_setval(personagem, Escolhido),
	b_setval(fim, 0),
	nb_setval(tentativas, 5),
	!.

subtrai :-
	nb_getval(tentativas, X),
    Y is (X - 1),
	nb_setval(tentativas, Y),
	
	(Y < 0 ->
		nl,write('Acabaram suas perguntas! voce precisa chutar um personagem.'),nl,
		chutarNome()
		;
		nl).

jogo([]).
jogo(L):-

	nb_getval(tentativas, X),
	nl, write('Voce tem '), write(X), write(' tentativas restantes.'), nl,

	% printar os personagens restantes
	nl, write('Estes sao os personagens que ainda podem ser o escolhido: '), 
	write(L), nl,

	subtrai,	% modifica a variavel global de tentativas, diminuindo 1

	% printar o personagem sorteado
	b_getval(personagem, Escolhido),
	%nl, write('O personagem sorteado foi: '), write(Escolhido), nl,
	nl, write('Opcoes:'), nl,
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

optionJogo(0, L):- chutarNome(),!.
optionJogo(1, L):- cabeloExiste(L), !.
optionJogo(2, L):- brincoTem(L),  !.
optionJogo(3, L):- sexoMulher(L), !.
optionJogo(4, L):- sexoHomem(L), !.
optionJogo(5, L):- cabeloCastanho(L), !.
optionJogo(6, L):- cabeloLoiro(L), !.
optionJogo(7, L):- cabeloPreto(L), !.
optionJogo(8, L):- cabeloBranco(L), !.
optionJogo(9, L):- cabeloRuivo(L), !.
optionJogo(10, L):- oculosUsa(L), !.
optionJogo(11, L):- chapeuUsa(L), !.
optionJogo(12, L):- boinaUsa(L), !.
optionJogo(13, L):- boneUsa(L), !.
optionJogo(14, L):- bigodeTem(L), !.
optionJogo(15, L):- barbaTem(L), !.
optionJogo(16, L):- corBranca(L), !.
optionJogo(17, L):- corNegra(L), !.



inter([], _, []).
inter([H1|T1], L2, [H1|Res]) :-
    member(H1, L2),
    inter(T1, L2, Res).
inter([_|T1], L2, Res) :-
    inter(T1, L2, Res).

chutarNome:-
	nl, write('Digite o nome do personagem: '),
	b_getval(personagem, Escolhido),
	read(Nome), nl,
	(Nome == Escolhido -> write('Parabens voce acertou o personagem escolhido!') 
	; 
	write('Poxa. Voce errou! Quem sabe na proxima vez?')), nl,
	halt,
	!.

cabeloExiste(L):-

	b_getval(personagem, Escolhido),
	cabelo(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		cabelo(Y, Escolhido),
		nl, nl,
		findall(X, cabelo(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido tem cabelo! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		cabelo(Y, Escolhido),
		nl, nl,
		findall(X, cabelo(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao tem cabelo! '), nl,
		jogo(L2), !.


brincoTem(L):-

	b_getval(personagem, Escolhido),
	brinco(Y, Escolhido), 										    % x recebe cor do brinco

	Y ->

		b_getval(personagem, Escolhido),
		brinco(Y, Escolhido),
		nl, nl,
		findall(X, brinco(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido usa brinco! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		brinco(Y, Escolhido),
		nl, nl,
		findall(X, brinco(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao usa brinco! '), nl,
		jogo(L2), !.


sexoMulher(L):-

	b_getval(personagem, Escolhido),
	sexofeminino(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		sexofeminino(Y, Escolhido),
		nl, nl,
		findall(X, sexofeminino(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido eh do sexo feminino! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		sexofeminino(Y, Escolhido),
		nl, nl,
		findall(X, sexofeminino(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao eh do sexo feminino! '), nl,
		jogo(L2), !.

sexoHomem(L):-

	b_getval(personagem, Escolhido),
	sexomasculino(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		sexomasculino(Y, Escolhido),
		nl, nl,
		findall(X, sexomasculino(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido eh do sexo masculino! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		sexomasculino(Y, Escolhido),
		nl, nl,
		findall(X, sexomasculino(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao eh do sexo masculino! '), nl,
		jogo(L2), !.

cabeloCastanho(L):-

	b_getval(personagem, Escolhido),
	cordecabelocastanho(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		cordecabelocastanho(Y, Escolhido),
		nl, nl,
		findall(X, cordecabelocastanho(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido tem cabelo castanho! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		cordecabelocastanho(Y, Escolhido),
		nl, nl,
		findall(X, cordecabelocastanho(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao tem cabelo castanho! '), nl,
		jogo(L2), !.


cabeloLoiro(L):-

	b_getval(personagem, Escolhido),
	cordecabeloloiro(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		cordecabeloloiro(Y, Escolhido),
		nl, nl,
		findall(X, cordecabeloloiro(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido tem cabelo loiro! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		cordecabeloloiro(Y, Escolhido),
		nl, nl,
		findall(X, cordecabeloloiro(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao tem cabelo loiro! '), nl,
		jogo(L2), !.

cabeloPreto(L):-

	b_getval(personagem, Escolhido),
	cordecabelopreto(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		cordecabelopreto(Y, Escolhido),
		nl, nl,
		findall(X, cordecabelopreto(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido tem cabelo preto! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		cordecabelopreto(Y, Escolhido),
		nl, nl,
		findall(X, cordecabelopreto(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao tem cabelo preto! '), nl,
		jogo(L2), !.


cabeloBranco(L):-

	b_getval(personagem, Escolhido),
	cordecabelobranco(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		cordecabelobranco(Y, Escolhido),
		nl, nl,
		findall(X, cordecabelobranco(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido tem cabelo branco! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		cordecabelobranco(Y, Escolhido),
		nl, nl,
		findall(X, cordecabelobranco(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao tem cabelo branco! '), nl,
		jogo(L2), !.

cabeloRuivo(L):-

	b_getval(personagem, Escolhido),
	cordecabeloruivo(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		cordecabeloruivo(Y, Escolhido),
		nl, nl,
		findall(X, cordecabeloruivo(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido tem cabelo ruivo! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		cordecabeloruivo(Y, Escolhido),
		nl, nl,
		findall(X, cordecabeloruivo(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao tem cabelo ruivo! '), nl,
		jogo(L2), !.

oculosUsa(L):-

	b_getval(personagem, Escolhido),
	oculos(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		oculos(Y, Escolhido),
		nl, nl,
		findall(X, oculos(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido usa oculos! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		oculos(Y, Escolhido),
		nl, nl,
		findall(X, oculos(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao usa oculos! '), nl,
		jogo(L2), !.

chapeuUsa(L):-

	b_getval(personagem, Escolhido),
	chapeu(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		chapeu(Y, Escolhido),
		nl, nl,
		findall(X, chapeu(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido usa chapeu! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		chapeu(Y, Escolhido),
		nl, nl,
		findall(X, chapeu(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao usa chapeu! '), nl,
		jogo(L2), !.


boinaUsa(L):-

	b_getval(personagem, Escolhido),
	boina(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		boina(Y, Escolhido),
		nl, nl,
		findall(X, boina(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido usa boina! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		boina(Y, Escolhido),
		nl, nl,
		findall(X, boina(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao usa boina! '), nl,
		jogo(L2), !.


boneUsa(L):-

	b_getval(personagem, Escolhido),
	bone(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		bone(Y, Escolhido),
		nl, nl,
		findall(X, bone(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido usa bone! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		bone(Y, Escolhido),
		nl, nl,
		findall(X, bone(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao usa bone! '), nl,
		jogo(L2), !.

bigodeTem(L):-

	b_getval(personagem, Escolhido),
	bigode(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		bigode(Y, Escolhido),
		nl, nl,
		findall(X, bigode(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido tem bigode! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		bigode(Y, Escolhido),
		nl, nl,
		findall(X, bigode(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao tem bigode! '), nl,
		jogo(L2), !.

barbaTem(L):-

	b_getval(personagem, Escolhido),
	barba(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		barba(Y, Escolhido),
		nl, nl,
		findall(X, barba(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido tem barba! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		barba(Y, Escolhido),
		nl, nl,
		findall(X, barba(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao tem barba! '), nl,
		jogo(L2), !.

corBranca(L):-

	b_getval(personagem, Escolhido),
	cordepelebranca(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		cordepelebranca(Y, Escolhido),
		nl, nl,
		findall(X, cordepelebranca(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido tem cor de pele Branca! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		cordepelebranca(Y, Escolhido),
		nl, nl,
		findall(X, cordepelebranca(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao tem cor de pele branca! '), nl,
		jogo(L2), !.

corNegra(L):-

	b_getval(personagem, Escolhido),
	cordepelenegra(Y, Escolhido), 										    

	Y ->

		b_getval(personagem, Escolhido),
		cordepelenegra(Y, Escolhido),
		nl, nl,
		findall(X, cordepelenegra(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido tem cor de pele negra! '), nl,
		jogo(L2), !
		
		;

		b_getval(personagem, Escolhido),
		cordepelenegra(Y, Escolhido),
		nl, nl,
		findall(X, cordepelenegra(Y, X), L1),
		inter(L, L1, L2),
		nl, write('O personagem escolhido nao tem cor de pele negra! '), nl,
		jogo(L2), !.