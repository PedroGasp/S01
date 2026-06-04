data Item = Item
    { nome      :: String
    , categoria :: String
    , preco     :: Double
    } deriving (Show)

data StatusCompra
    = Pendente
    | Concluida
    | Cancelada
    deriving (Show, Eq)

data Compra = Compra
    { itens  :: [Item]
    , status :: StatusCompra
    } deriving (Show)

totalItens :: [Item] -> Double
totalItens listaItens =
    sum (map preco listaItens)

valorFinal :: Compra -> Double
valorFinal compra
    | status compra == Cancelada = 0.0
    | total > 200 = total * 0.9
    | otherwise = total
    where
        total = totalItens (itens compra)

main :: IO ()
main = do
    let espada = Item "Espada Mestra" "Arma" 120.0
    let escudo = Item "Escudo Hyliano" "Defesa" 90.0
    let pocao = Item "Elixir Energizante" "Consumivel" 20.0

    let compra =
            Compra [espada, escudo, pocao] Concluida

    putStrLn "Compra realizada:"
    putStrLn $ "Valor final: R$ " ++ show (valorFinal compra)
