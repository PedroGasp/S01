data Servico = Servico
    { nome  :: String
    , tipo  :: String
    , preco :: Double
    } deriving (Show)

data StatusAtendimento
    = EmAndamento
    | Finalizado
    | Cancelado
    deriving (Show, Eq)

data Atendimento = Atendimento
    { servicos :: [Servico]
    , status   :: StatusAtendimento
    } deriving (Show)

totalServicos :: [Servico] -> Double
totalServicos listaServicos =
    sum (map preco listaServicos)

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
    | status atendimento == Cancelado = 0.0
    | length (servicos atendimento) > 3 = total * 1.25
    | otherwise = total
    where
        total = totalServicos (servicos atendimento)

primeiroServico :: Atendimento -> String
primeiroServico atendimento =
    case servicos atendimento of
        []    -> "Nenhum servico cadastrado."
        (x:_) -> nome x

main :: IO ()
main = do
    let banho = Servico "Banho Completo" "Limpeza" 50.0
    let massagem = Servico "Massagem" "Bem-estar" 80.0
    let perfume = Servico "Perfume Espiritual" "Aroma" 30.0
    let limpeza = Servico "Purificacao" "Energia" 60.0

    let atendimento1 =
            Atendimento [massagem, perfume] Finalizado

    let atendimento2 =
            Atendimento [banho, massagem, perfume, limpeza] EmAndamento
    
    let atendimento3 =
            Atendimento [] EmAndamento

    putStrLn "Atendimento 1:"
    putStrLn $ "Primeiro servico: " ++ primeiroServico atendimento1
    putStrLn $ "Valor final: R$ " ++ show (valorFinalAtendimento atendimento1)

    putStrLn "\nAtendimento 2:"
    putStrLn $ "Primeiro servico: " ++ primeiroServico atendimento2
    putStrLn $ "Valor final: R$ " ++ show (valorFinalAtendimento atendimento2)
    
    putStrLn "\nAtendimento 3:"
    putStrLn $ "Primeiro servico: " ++ primeiroServico atendimento3
    putStrLn $ "Valor final: R$ " ++ show (valorFinalAtendimento atendimento3)
