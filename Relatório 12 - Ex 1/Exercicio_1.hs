data Bebida = Bebida
    { nome  :: String
    , tipo  :: String
    , preco :: Double
    } deriving (Show)
    
data StatusPedido
    = Aberto
    | Entregue
    | Cancelado
    deriving (Show, Eq)
    
data Pedido = Pedido
    { bebidas :: [Bebida]
    , status  :: StatusPedido
    } deriving (Show)

valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
    | status pedido == Cancelado = 0.0
    | otherwise = sum (map preco (bebidas pedido))

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
