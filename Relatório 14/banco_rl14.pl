% Fatos: Fluxo de Energia (predador, presa) - HIERARQUIA DA CADEIA ALIMENTAR
alimenta(sol, plantas).
alimenta(terra, plantas).
alimenta(sol, algas).
alimenta(agua, algas).
alimenta(plantas, capivara).
alimenta(plantas, veado).
alimenta(plantas, gafanhoto).
alimenta(plantas, anta).
alimenta(capivara, onca).
alimenta(veado, onca).
alimenta(gafanhoto, sapo).
alimenta(gafanhoto, passaro).
alimenta(sapo, cobra).
alimenta(passaro, cobra).
alimenta(sapo, gavião).
alimenta(passaro, gavião).
alimenta(peixe, jacare).
alimenta(capivara, jacare).
alimenta(fruta, tucano). % Recurso específico
alimenta(arvore, tucano).
alimenta(inseto, tamandua).
alimenta(terra, sucuri).
alimenta(agua, sucuri).

% Fatos: Habitat e Nicho Ecológico (especie, nicho)
nicho(onca, predador_topo).
nicho(onca, floresta_densa).
nicho(jacare, rios).
nicho(jacare, pantanal).
nicho(sucuri, pântano).
nicho(tucano, copas_arvores).
nicho(tucano, dispersor_sementes).
nicho(gavião, ceu).
nicho(tamandua, solo).
nicho(tamandua, controlador_insetos).
nicho(borboleta, polinizador).
nicho(abelha, polinizador).
nicho(fungo, decompositor).

% Fatos: Defesas e Atributos (especie, atributo)
defesa(onca, camuflagem).
defesa(jacare, couraça).
defesa(sucuri, constrição).
defesa(sapo, veneno).
defesa(porco_espinho, espinhos).

% Fatos: Characteristics Biológicas (especie, caracteristica)
caracteristica(onca, felino).
caracteristica(gavião, ave_rapina).
caracteristica(sucuri, reptil).
caracteristica(tamandua, mamifero).
caracteristica(sapo, anfibio).
caracteristica(mortal, capivara). % Presa comum

% Fatos: Simbiose e Cooperação (Simétrico)
simbiose(abelha, flores).
simbiose(flores, abelha).
simbiose(passaro_palito, jacare).
simbiose(jacare, passaro_palito).
simbiose(fungo, raizes).
simbiose(raizes, fungo).
simbiose(formiga, acácia).
simbiose(acácia, formiga).

% Fatos: Localização de Avistamento
local_comum(onca, cavernas).
local_comum(jacare, margens).
local_comum(sucuri, profundezas).
local_comum(tucano, ninhos_altos).
local_comum(gafanhoto, arbustos).

% EXERCICIO 1:

% Regra 1:
especie_chave(Animal) :-
    (alimenta(agua, Animal) ; alimenta(terra, Animal)),
    (nicho(Animal, rios) ; nicho(Animal, pântano) ; nicho(Animal, profundezas)).

% Query 1: 
% ?- especie_chave(Quem).

% EXERCICIO 2:

% Regra 2:
especie_dominante(Animal) :-
    nicho(Animal, X),
    nicho(Animal, Y),
    X \= Y,
    local_comum(Animal, margens).

% Query 2: 
% ?- especie_dominante(Quem).

% EXERCICIO 3:

% Regra 3:
competidores_diretos(A, B) :-
    alimenta(sol, A),
    alimenta(terra, A),
    alimenta(sol, B),
    alimenta(terra, B),
    A \= B.

% Query 3: 
% ?- competidores_diretos(X, Y).

% EXERCICIO 4:

% Regra 4:
% Caso Base (a):
fluxo_energia(A, D) :- 
    alimenta(A, D).

% Passo Recursivo (b):
fluxo_energia(A, D) :- 
    alimenta(A, Z), 
    fluxo_energia(Z, D).

% Query 4: 
% ?- fluxo_energia(sol, ParaQuem).
