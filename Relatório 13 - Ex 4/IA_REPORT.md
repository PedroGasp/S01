Identificação: Pedro Gasparotto Carvalho - 655

Histórico de Prompts: Mandei uma foto para do exercicio para o GPT e disse: Faça esse código em LISP e explique como que funciona cada parte.

Respostas Obtidas: 

Claro. Vou colocar o código completo primeiro e depois explicar cada bloco como se estivéssemos analisando linha por linha em sala de aula.

Código Completo
(defstruct local
  nome
  elemento
  dificuldade
  recompensa)

(defun bonus-elemental (local)
  (cond
    ((or (string= (local-elemento local) "Pyro")
         (string= (local-elemento local) "Electro"))
     (* (local-recompensa local) 1.20))

    ((string= (local-elemento local) "Cryo")
     (* (local-recompensa local) 1.10))

    (t
     (local-recompensa local))))

(defun vale-a-pena (local)
  (and
   (> (bonus-elemental local) 500)
   (<= (local-dificuldade local) 3)))

(defun descricao-local (local)
  (format nil
          "Nome: ~A | Elemento: ~A | Dificuldade: ~A | Recompensa Bonus: ~,2F"
          (local-nome local)
          (local-elemento local)
          (local-dificuldade local)
          (bonus-elemental local)))

(defun rota-de-farm (catalogo)
  (mapcar
   #'(lambda (local)
       (format nil
               "~A - Recompensa: ~,2F"
               (local-nome local)
               (bonus-elemental local)))
   (remove-if-not #'vale-a-pena catalogo)))

(let ((catalogo
       (list
        (make-local
         :nome "Pyro Regisvine"
         :elemento "Pyro"
         :dificuldade 3
         :recompensa 500)

        (make-local
         :nome "Electro Hypostasis"
         :elemento "Electro"
         :dificuldade 2
         :recompensa 600)

        (make-local
         :nome "Cryo Regisvine"
         :elemento "Cryo"
         :dificuldade 3
         :recompensa 550)

        (make-local
         :nome "Oceanid"
         :elemento "Hydro"
         :dificuldade 4
         :recompensa 700)

        (make-local
         :nome "Stormterror"
         :elemento "Anemo"
         :dificuldade 2
         :recompensa 450))))

  (format t "=== Catalogo Completo ===~%")

  (mapc
   #'(lambda (local)
       (format t "~A~%"
               (descricao-local local)))
   catalogo)

  (format t "~%=== Rota de Farm Recomendada ===~%")

  (mapc
   #'(lambda (linha)
       (format t "~A~%" linha))
   (rota-de-farm catalogo)))
1. Definição da estrutura
(defstruct local
  nome
  elemento
  dificuldade
  recompensa)

Aqui estamos criando um novo tipo chamado local.

Cada local possui:

nome
elemento
dificuldade
recompensa

É parecido com:

Haskell
data Local = Local
  { nome :: String
  , elemento :: String
  , dificuldade :: Int
  , recompensa :: Double
  }

ou em Java:

class Local {
    String nome;
    String elemento;
    int dificuldade;
    double recompensa;
}
O que o defstruct cria automaticamente?

Ele cria:

Construtor
(make-local ...)

Exemplo:

(make-local
 :nome "Oceanid"
 :elemento "Hydro"
 :dificuldade 4
 :recompensa 700)
Acessores
(local-nome local)
(local-elemento local)
(local-dificuldade local)
(local-recompensa local)

Essas funções servem para pegar os valores armazenados.

2. Função bonus-elemental
(defun bonus-elemental (local)

Define uma função chamada bonus-elemental.

Recebe um local.

O cond
(cond
 ...)

Funciona como vários ifs.

Primeiro caso
((or (string= (local-elemento local) "Pyro")
     (string= (local-elemento local) "Electro"))
 (* (local-recompensa local) 1.20))

Se o elemento for:

Pyro
ou Electro

multiplica a recompensa por 1.20.

Exemplo:

500

vira

600
Segundo caso
((string= (local-elemento local) "Cryo")
 (* (local-recompensa local) 1.10))

Se for Cryo:

550

vira

605
Caso padrão
(t
 (local-recompensa local))

O t significa:

qualquer outro caso

Retorna a recompensa original.

3. Função vale-a-pena
(defun vale-a-pena (local)

Verifica se um local deve entrar na rota recomendada.

Condição 1
(> (bonus-elemental local) 500)

Pergunta:

A recompensa com bônus é maior que 500?
Condição 2
(<= (local-dificuldade local) 3)

Pergunta:

A dificuldade é menor ou igual a 3?
and
(and ... ...)

As duas condições precisam ser verdadeiras.

Exemplo:

Recompensa = 600
Dificuldade = 3

Resultado:

T
4. Função descricao-local
(defun descricao-local (local)

Serve para criar uma string formatada.

format
(format nil ...)

Quando usamos nil, a função retorna uma string.

~A
~A

Mostra qualquer valor.

~,2F
~,2F

Mostra um número decimal com duas casas.

Exemplo:

600.00

Resultado:

Nome: Pyro Regisvine | Elemento: Pyro | Dificuldade: 3 | Recompensa Bonus: 600.00
5. Função rota-de-farm
(defun rota-de-farm (catalogo)

Recebe uma lista de locais.

remove-if-not
(remove-if-not #'vale-a-pena catalogo)

É o equivalente ao:

filter valeAPena catalogo

Ele remove todos os locais que não satisfazem a condição.

Exemplo:

Antes:

Pyro Regisvine
Electro Hypostasis
Oceanid
Stormterror

Depois:

Pyro Regisvine
Electro Hypostasis
mapcar
(mapcar ...)

É equivalente ao:

map

ou

stream().map(...)

Transforma cada local em uma string.

Exemplo:

Entrada:

Pyro Regisvine

Saída:

Pyro Regisvine - Recompensa: 600.00
6. Criação do catálogo
(let ((catalogo
       (list
         ...
       )))

Cria uma variável chamada catalogo.

Ela contém uma lista de locais.

Exemplo:

(make-local
 :nome "Electro Hypostasis"
 :elemento "Electro"
 :dificuldade 2
 :recompensa 600)

Cria o objeto:

Nome: Electro Hypostasis
Elemento: Electro
Dificuldade: 2
Recompensa: 600
7. Impressão do catálogo completo
(mapc
 #'(lambda (local)
     (format t "~A~%"
             (descricao-local local)))
 catalogo)
mapc

Percorre a lista.

É parecido com:

Java
for(Local l : catalogo)
Python
for local in catalogo:

Para cada local:

(descricao-local local)

gera uma string.

Depois:

(format t ...)

imprime essa string.

8. Impressão da rota recomendada
(mapc
 #'(lambda (linha)
     (format t "~A~%" linha))
 (rota-de-farm catalogo))

Primeiro:

(rota-de-farm catalogo)

gera uma lista de strings:

Pyro Regisvine - Recompensa: 600.00
Electro Hypostasis - Recompensa: 720.00
Cryo Regisvine - Recompensa: 605.00

Depois o mapc imprime cada linha.

Fluxo completo do programa
Criar locais
       ↓
Calcular bonus-elemental
       ↓
Exibir catalogo completo
       ↓
Filtrar locais com vale-a-pena
       ↓
Transformar em strings
       ↓
Exibir rota recomendada

Essa explicação costuma ser suficiente para justificar o código em uma apresentação ou prova prática, porque mostra exatamente onde estão os conceitos pedidos no enunciado: defstruct, guardas (cond), filtro (remove-if-not) e mapeamento (mapcar).

Relatório de Satisfação e Aprendizado: Mais uma vez tive uma dificuldade tremenda com esse exercício, o principal motivo são essas partes de decisão e lógica no código. Por algum motivo toda vez que vejo essas entradas eu fico perdido no seu funcionamento e tenho que perguntar para a IA, o resto são coisas fáceis de entender como o defstruct e o defun, mais de resto é extremamente desgastante interpretar o código, a legibilidade é horrível e qualquer erro pode quebrar o código inteiro.  
