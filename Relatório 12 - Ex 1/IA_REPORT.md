Identificação: Pedro Gasparotto Carvalho

Histórico de Prompts: Mandei uma versão transcrita da primeira ativade para a IA fazer em Huskell, depois pedi para explicar como o código funciona. 

Respostas Obtidas:

-- Tipo Bebida
data Bebida = Bebida
    { nome  :: String
    , tipo  :: String
    , preco :: Double
    } deriving (Show)

-- Tipo StatusPedido
data StatusPedido
    = Aberto
    | Entregue
    | Cancelado
    deriving (Show, Eq)

-- Tipo Pedido
data Pedido = Pedido
    { bebidas :: [Bebida]
    , status  :: StatusPedido
    } deriving (Show)

-- Soma dos preços das bebidas
valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
    | status pedido == Cancelado = 0.0
    | otherwise = sum (map preco (bebidas pedido))

-- Retorna o nome da primeira bebida
primeiraBebida :: Pedido -> String
primeiraBebida pedido =
    case bebidas pedido of
        []    -> "Nenhuma bebida no pedido."
        (x:_) -> nome x

main :: IO ()
main = do
    let cafe = Bebida "Cafe" "Quente" 8.50
    let cha = Bebida "Cha Verde" "Quente" 7.00
    let suco = Bebida "Suco de Laranja" "Frio" 10.00

    let pedidoEntregue =
            Pedido [cafe, cha] Entregue

    let pedidoCancelado =
            Pedido [suco, cafe] Cancelado

    putStrLn "Pedido Entregue:"
    putStrLn $ "Primeira bebida: " ++ primeiraBebida pedidoEntregue
    putStrLn $ "Valor total: R$ " ++ show (valorTotalPedido pedidoEntregue)

    putStrLn "\nPedido Cancelado:"
    putStrLn $ "Primeira bebida: " ++ primeiraBebida pedidoCancelado
    putStrLn $ "Valor total: R$ " ++ show (valorTotalPedido pedidoCancelado)

  Claro. Vou explicar o código por partes.

1. Tipo Bebida
data Bebida = Bebida
    { nome  :: String
    , tipo  :: String
    , preco :: Double
    } deriving (Show)

Aqui estamos criando um tipo de dado chamado Bebida.

Cada bebida possui:

nome → nome da bebida
tipo → quente, frio, etc.
preco → valor da bebida

É semelhante a uma classe simples em outras linguagens.

Exemplo:

let cafe = Bebida "Cafe" "Quente" 8.50

Cria uma bebida com:

nome = Cafe
tipo = Quente
preco = 8.50
2. Tipo StatusPedido
data StatusPedido
    = Aberto
    | Entregue
    | Cancelado
    deriving (Show, Eq)

Aqui criamos um tipo que pode assumir apenas três valores:

Aberto
Entregue
Cancelado

É parecido com um enum.

Exemplo:

statusPedido = Entregue
Por que usar Eq?
deriving (Eq)

Permite comparar valores.

Sem isso:

status pedido == Cancelado

geraria erro.

Com Eq, podemos fazer:

Aberto == Aberto      -- True
Aberto == Cancelado   -- False
3. Tipo Pedido
data Pedido = Pedido
    { bebidas :: [Bebida]
    , status  :: StatusPedido
    } deriving (Show)

Um pedido possui:

uma lista de bebidas
um status

O tipo [Bebida] significa:

Lista de Bebida

Exemplo:

Pedido [cafe, cha] Entregue

Representa:

Bebidas:
- Cafe
- Cha

Status:
- Entregue
4. Função valorTotalPedido
valorTotalPedido :: Pedido -> Double

Essa linha indica:

Recebe um Pedido
Retorna um Double
Implementação
valorTotalPedido pedido
    | status pedido == Cancelado = 0.0
    | otherwise = sum (map preco (bebidas pedido))

Os símbolos | são guards.

Funciona como um if.

Primeiro guard
| status pedido == Cancelado = 0.0

Se o pedido estiver cancelado:

retorne 0.0
Segundo guard
| otherwise = ...

otherwise significa:

caso contrário

Então:

sum (map preco (bebidas pedido))
Entendendo map

Suponha:

[cafe, cha]

onde

cafe = 8.50
cha  = 7.00

Quando fazemos:

map preco (bebidas pedido)

obtemos:

[8.50, 7.00]

porque map aplica a função preco em cada bebida.

Entendendo sum

Depois:

sum [8.50, 7.00]

resultado:

15.50
5. Função primeiraBebida
primeiraBebida :: Pedido -> String

Recebe um pedido e retorna uma string.

Implementação
primeiraBebida pedido =
    case bebidas pedido of

Estamos analisando a lista de bebidas.

Caso lista vazia
[] -> "Nenhuma bebida no pedido."

[] significa:

lista vazia

Exemplo:

Pedido [] Aberto

Retorna:

"Nenhuma bebida no pedido."
Caso exista pelo menos uma bebida
(x:_) -> nome x

Esse é um pattern matching.

O que significa (x:_)?

Em Haskell:

cabeca : resto

Por exemplo:

[1,2,3]

é interpretado como:

1 : [2,3]

Logo:

(x:_)

significa:

x = primeira bebida
_ = resto da lista (ignorado)

Exemplo:

[cafe, cha]

vira:

x = cafe
_ = [cha]

Então:

nome x

retorna:

"Cafe"
6. Função main
main :: IO ()

É o ponto de entrada do programa.

Criando bebidas
let cafe = Bebida "Cafe" "Quente" 8.50
let cha = Bebida "Cha Verde" "Quente" 7.00
let suco = Bebida "Suco de Laranja" "Frio" 10.00

Cria três bebidas.

Criando pedido entregue
let pedidoEntregue =
        Pedido [cafe, cha] Entregue

Contém:

Cafe
Cha Verde

Status:

Entregue
Criando pedido cancelado
let pedidoCancelado =
        Pedido [suco, cafe] Cancelado

Contém:

Suco
Cafe

Mas está cancelado.

Exibindo resultados
putStrLn $ "Primeira bebida: " ++ primeiraBebida pedidoEntregue

++ concatena strings.

Exemplo:

"Primeira bebida: " ++ "Cafe"

Resultado:

Primeira bebida: Cafe
putStrLn $ "Valor total: R$ " ++ show (valorTotalPedido pedidoEntregue)

show converte números em texto.

Exemplo:

show 15.5

resultado:

"15.5"
Fluxo completo
1. Cria as bebidas
2. Cria dois pedidos
3. Calcula o total de cada pedido
4. Se estiver Cancelado → retorna 0.0
5. Se não estiver Cancelado → soma os preços
6. Mostra a primeira bebida usando pattern matching
7. Exibe tudo na tela

Esse exercício foi feito para praticar três conceitos importantes de Haskell:

Tipos algébricos (data)
Guards (|)
Pattern Matching ([], (x:_))

Relatório de Satisfação e Aprendizado: Mesmo assistindo a vídeo aula sobre a linguagem ainda assim surgiu várias duvidas quando tentei fazer por conta própria, mesmo revendo o vídeo várias vezes não consegui ter uma noção de como eu poderia fazer o código da atividade. Com isso em mente, usei a IA pra tentar ter uma noção melhor do 'flow' da linguagem e as formas que eu poderia escrever usando essa lingua. E com a ajuda da IA explicando como cada parte funciona, posso usar esse código inicial como referência e guia para os próximos exercicios, visto a dificuldade que tive com a lingua e seus usos. 
