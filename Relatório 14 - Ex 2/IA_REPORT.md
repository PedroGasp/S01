Identificação: Pedro Gasparotto Carvalho

Histórico de Prompts:Tirei uma print do exercício e pedi pro Gemini: Faça esse código em lisp e explique detalhadamente cada parte dele. Especialmente a parte de verificar o local e o perigo da criatura.

Respostas Obtidas: Com certeza! Vamos construir o ecossistema de Subnautica utilizando Common Lisp.

Como o enunciado traz assinaturas de funções típicas de linguagens estritamente tipadas e funcionais (como Haskell), adaptaremos esses conceitos para a filosofia idiomática do Common Lisp usando estruturas (defstruct), funções de alta ordem (remove-if-not / filter, mapcar / map) e símbolos para representar os enumeradores.

;; ==========================================
;; 1. DEFINIÇÃO DOS TIPOS E CONSTRUTORES
;; ==========================================

;; Em Lisp, para a "Periculosidade", usamos símbolos (:baixa, :media, :alta).
;; Não precisamos de um tipo rígido, mas podemos criar uma função para validar se desejado.

(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

;; ==========================================
;; 2. FUNÇÕES DE FILTRAGEM E RELATÓRIO
;; ==========================================

;; Implementa filtraPorPerigo :: [Criatura] -> [Criatura]
(defun filtra-por-perigo (lista-criaturas)
  (remove-if-not (lambda (c)
                   (not (eq (criatura-periculosidade c) :baixa)))
                 lista-criaturas))

;; Implementa relatorioProfundidade :: [Criatura] -> [String]
(defun relatorio-profundidade (lista-criaturas)
  (let ((criaturas-deep (remove-if-not (lambda (c)
                                         (string-equal (criatura-ambiente c) "Deep"))
                                       lista-criaturas)))
    (mapcar (lambda (c)
              (format nil "[~A]: Vive em [~A]" 
                      (criatura-nome c) 
                      (criatura-ambiente c)))
            criaturas-deep)))

;; Implementa descricaoCriatura :: Criatura -> String
(defun descricao-criatura (c)
  (format nil "Nome: ~A | Ambiente: ~A | Perigo: ~A"
          (criatura-nome c)
          (criatura-ambiente c)
          (symbol-name (criatura-periculosidade c))))

;; ==========================================
;; 3. FUNÇÃO MAIN (EXECUÇÃO CENTRAL)
;; ==========================================

(defun main ()
  ;; Definição do catálogo com pelo menos 4 criaturas
  (let ((catalogo (list
                   (make-criatura :nome "Peeper" 
                                  :ambiente "Safe Shallows" 
                                  :periculosidade :baixa 
                                  :vida-media 5)
                   (make-criatura :nome "Reaper Leviathan" 
                                  :ambiente "Crash Zone" 
                                  :periculosidade :alta 
                                  :vida-media 100)
                   (make-criatura :nome "Ghost Leviathan" 
                                  :ambiente "Deep" 
                                  :periculosidade :alta 
                                  :vida-media 150)
                   (make-criatura :nome "Crabsquid" 
                                  :ambiente "Deep" 
                                  :periculosidade :media 
                                  :vida-media 40))))

    ;; 1. Exibir o catálogo completo
    (format t "--- CATÁLOGO COMPLETO ---~%")
    (dolist (c catalogo)
      (format t "~A~%" (descricao-criatura c)))

    ;; 2. Exibir criaturas perigosas filtradas (não-baixas)
    (format t "~%--- CRIATURAS PERIGOSAS FILTRADAS ---~%")
    (let ((perigosas (filtra-por-perigo catalogo)))
      (dolist (c perigosas)
        (format t "~A~%" (descricao-criatura c))))

    ;; 3. Exibir o relatório de profundidade
    (format t "~%--- RELATÓRIO DE PROFUNDIDADE (\"Deep\") ---~%")
    (let ((relatorio (relatorio-profundidade catalogo)))
      (dolist (linha relatorio)
        (format t "~A~%" linha)))))

;; Executa o programa
(main)

Explicação Detalhada do Código
1. Definição do Tipo Criatura e Periculosidade
Em Common Lisp, a forma mais robusta e direta de criar registros/objetos com campos nomeados é usando defstruct.

O (defstruct criatura ...) cria automaticamente uma fábrica de objetos chamada make-criatura e funções leitoras para cada campo (como criatura-nome, criatura-ambiente, etc.).

Periculosidade (Enum): Em vez de criar um tipo rígido com construtores (comum em linguagens como Haskell ou C#), em Lisp usamos Keywords (símbolos que começam com : como :baixa, :media, :alta). Eles agem perfeitamente como enumeradores imutáveis e são extremamente performáticos para comparações.

2. Verificação de Condições (Local e Perigo) — Foco Especial
A filtragem e checagem de propriedades em estruturas de dados é onde a programação funcional em Lisp brilha. Vamos analisar detalhadamente como o programa verifica essas duas propriedades:

A. Verificando e Filtrando o Perigo (filtra-por-perigo)
O enunciado pede para retornar as criaturas cuja periculosidade não seja Baixa.

Lisp
(remove-if-not (lambda (c) (not (eq (criatura-periculosidade c) :baixa))) lista-criaturas)
remove-if-not: É a função equivalente ao filter tradicional de outras linguagens. Ela percorre a lista e mantém apenas os elementos que retornarem um valor verdadeiro (T) para o teste fornecido.

lambda (c): Cria uma função anônima que recebe uma criatura c.

(criatura-periculosidade c): Acessa o campo de periculosidade daquela criatura específica.

eq: Em Lisp, eq é a forma mais rápida e correta de comparar símbolos/keywords. Ele checa se os dois ponteiros na memória apontam para o mesmo símbolo (neste caso, :baixa).

not: Inverte o resultado. Se a periculosidade for igual a :baixa, eq retorna verdadeiro, o not transforma em falso, e o remove-if-not descarta a criatura. Se for :media ou :alta, a expressão se torna verdadeira e a criatura é mantida.

B. Verificando o Ambiente (relatorio-profundidade)
Aqui precisamos primeiro isolar as criaturas que vivem no ambiente "Deep".

Lisp
(remove-if-not (lambda (c) (string-equal (criatura-ambiente c) "Deep")) lista-criaturas)
Por que string-equal em vez de eq ou =? Em Lisp, strings são arrays de caracteres. O operador eq não funciona de forma confiável com strings. Devemos usar funções específicas para strings. O string-equal compara os caracteres de forma case-insensitive (ou seja, ignora maiúsculas e minúsculas), o que previne erros caso alguém digite "deep" ou "DEEP". Se você quisesse uma comparação estrita diferenciando maiúsculas, usaria string=.

3. Transformação de Dados com Map (mapcar)
No relatório de profundidade, após filtrar as criaturas que vivem no "Deep", precisamos transformá-las em strings de texto formatadas.

Lisp
(mapcar (lambda (c) (format nil "[~A]: Vive em [~A]" ...)) criaturas-deep)
mapcar: É o map clássico do Lisp para listas. Ele aplica uma função a cada item da lista e retorna uma nova lista com os resultados.

format nil: A função format serve para construir textos. Quando o primeiro argumento é nil, ela não imprime nada na tela; em vez disso, ela retorna a string gerada para que o mapcar possa guardá-la na nova lista. O modificador ~A aceita qualquer tipo de dado de forma estética.

4. A Função Principal (main)
let: Cria variáveis locais. Aqui criamos a variável catalogo contendo a lista com as 4 criaturas exigidas (Peeper, Reaper Leviathan, e duas criaturas do "Deep": Ghost Leviathan e Crabsquid).

dolist: É uma estrutura de repetição limpa para iterar sobre listas. (dolist (c catalogo) ...) significa: "para cada criatura c dentro de catalogo, faça...".

format t: Diferente de quando usamos nil, passar t como primeiro argumento diz ao Lisp para imprimir o texto diretamente no terminal (saída padrão), seguido por ~%, que representa a quebra de linha.

Relatório de Satisfação e Aprendizado: Tive muita dificuldade com a parte de profundidade e perigo quando tentei fazer esse código, e a escrita da linguagem não me ajudou muito, tive que recorrer a IA por causa dessa dificuldade que tive. Mesmo com a explicação da IA ainda estou tendo dificuldade, o jeito que a linguagem é escrita não está me ajudando muito em entender a parte lógica do código. 
