# CaraCara

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 04<br>
**Paradigma**: Lógico<br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| 18/0096991  |  Álvaro Leles |
| 18/0100831  |  Gabriel Avelino |
| 18/0145088  |  Gabriel Bonifácio |
| 18/0101617  |  Guilherme de Morais |
| 18/0102087  |  Ian Fillipe |
| 18/0113666  |  Ítalo Guimarães |
| 18/0102656  |  Ítalo Vinícius |
| 20/0043111  |  Ricardo De Castro |

## Sobre 
<p style="text-indent: 20px; text-align: justify">
Para a entrega do paradigma lógico, foi escolhido o jogo clássico de tabuleiro Cara-a-Cara, no qual o objetivo é descobrir as pessoas (peças) do outro jogador, através de dicas sobre as características únicas de cada peça do jogador. Nessa versão, o jogador tentara adivinhar a pessoa que a máquina ira gerar a partir de uma base de dados que foi criada baseada no verdadeiro Cara-a-cara, adivinhando se a pessoa escolhida possui ou não as características.
</p>

## Screenshots

### Tutorial
![img1](./img/screenshot_1.png)

### Começando a jogar
![img2](./img/screenshot_2.png)

## Instalação 
**Linguagens**: PROLOG<br>
**Tecnologias**: SWI-Prolog<br>

(É necessário para rodar esta aplicação SWI-Prolog e recomenda-se rodá-la no ambiente Ubuntu ou utilizando no windows o WSL)

Para instalar o SWI-Prolog no Ubuntu, basta digitar os comandos:

```
sudo apt-add-repository ppa:swi-prolog/stable
sudo apt-get update
sudo apt-get install swi-prolog
```

## Uso 
No terminal, basta executar o seguinte comando:

```
swipl menu.pl
```

A partir daí, basta jogar conforme as instruções descritas no terminal, lembrando sempre de adicionar um ponto final(.) ao final de cada entrada.

## Vídeo

#### [Apresentação final do projeto](https://youtu.be/DZVU1EvvL-4)

## Participações
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
| Álvaro Leles  | Participei das definições iniciais do projeto, como construção da metodologia e da base de conhecimento e contribuí com o desenvolvimento inicial e final do projeto principalmente  | Boa |
| Gabriel Avelino  |  Participei das criações do menu e da lógica do projeto | Boa |
| Gabriel Bonifácio  | Criação da função Jogo, da introdução inicial e contribuição na funcionalidade de chutar o nome, além de participações em outras funções.  | Excelente |
| Guilherme de Morais  |  Participei da criação das lógicas para contagem de tentativas, criação de condicionais e lógica de filtragem de personagens sobre as perguntas feitas pelo jogador. | Excelente |
| Ítalo Alves  | Contribuição na criação dos personagens na base de dados, implementação do tutorial e das mensagens nos menus. | Boa |
| Ian Fillipe  | Implementei a estratégia de realizar a interseção de listas para fazer a filtragem de personagens, participei da criação da regra 'jogo', e dei suporte no desenvolvimento de outra partes do projeto | Excelente |
| Ítalo Vinícius  | Participei de grande parte do desenvolvimento da lógica do jogo e para resolver os problemas que estávamos tendo | Excelente |
| Ricardo Castro  | Contribuição para popular a base de dados e implementação dos menus e do tutorial. | Boa |

## Outros 
Quaisquer outras informações sobre o projeto podem ser descritas aqui.


(i) Lições Aprendidas;

- Aprendizado sobre construção de bases de conhecimento e manipulá-las.
- Entendemos como os fatos e regras funcionam além dos predicados fornecidos pelo SWI

(ii) Percepções;

Entendemos a importância e as consequências de uma base bem construída e estruturada para os futuros trabalhos feitos sobre ela. Também achamos a estrutura muito parecida com a linguagem Haskell, apesar de ser um paradigma diferente.

(iii) Contribuições e Fragilidades

- Quanto às contribuições, conseguimos fazer com que todos os integrantes desenvolvessem o projeto, com na maioria dos casos conseguindo ter contribuição necessária dos integrantes, por meio da metodologia que adotamos de pair programming, em que enquanto um desenvolvia, os outros ficavam em chamada juntos ajudando a relembrar as peculiaridades da linguagem e dando melhores ideias para ajudar a construir as regras necessárias para o nosso jogo.

- Acreditamos que o nosso projeto tenha algumas fragilidades quanto às regras do jogo Cara a Cara original, pois não conseguimos construir por meio da linguagem Prolog todas as regras desse jogo - inclusive, faltando alguns detalhes que deixamos passar despercebido, por termos deixado para desenvolver o projeto muito em cima da hora - por os integrantes deste grupo terem demorado a ter um domínio satisfatório da linguagem necessário para a realização do que propusemos.

(iV) Trabalhos Futuros.

- Adicionar recursos visuais.

- Modularizar o código, para aproveitar partes semelhantes do código.

- Adicionar nome sorteado ao final do jogo mesmo que o jogador perca.

- Adicionar mais personagens e mais características, dando assim mais dinâmica para o jogo.

## Fontes
- [Tutorial de prolog](https://cs.union.edu/~striegnk/learn-prolog-now/html/)
- [Outro tutorial de prolog](https://cs.union.edu/~striegnk/learn-prolog-now/html/)
- [Varaiveis globais](https://www.swi-prolog.org/pldoc/man?section=gvar)
- [Listas (documentação oficial)](https://www.swi-prolog.org/pldoc/doc/_SWI_/library/lists.pl)
- [Listas em Prolog](https://www.tutorialspoint.com/prolog/prolog_lists.htm)
- [Documentação SWI-Prolog](https://www.swi-prolog.org)
- Além dos vídeos disponibilizados no moodle UnB da discplina
