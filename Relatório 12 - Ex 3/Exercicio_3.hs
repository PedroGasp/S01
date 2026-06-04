data Banda = Banda
    { nome   :: String
    , genero :: String
    , cache  :: Double
    } deriving (Show)

data StatusEvento
    = Ativo
    | Encerrado
    | Cancelado
    deriving (Show, Eq)

data Evento = Evento
    { bandas :: [Banda]
    , status :: StatusEvento
    } deriving (Show)

custoTotalEvento :: Evento -> Double
custoTotalEvento evento
    | status evento == Cancelado = 0.0
    | otherwise = total * 1.2
    where
        total = sum (map cache (bandas evento))

bandaAbertura :: Evento -> String
bandaAbertura evento =
    case bandas evento of
        []    -> "Nenhuma banda cadastrada."
        (x:_) -> nome x

bandaEncerramento :: Evento -> String
bandaEncerramento evento =
    case bandas evento of
        [] -> "Nenhuma banda cadastrada."
        xs -> nome (last xs)

main :: IO ()
main = do
    let rockers = Banda "Nirvana" "Rock" 5000.0
    let jazzBand = Banda "Blue Jazz" "Jazz" 3500.0
    let metalBand = Banda "Metallica" "Metal" 4500.0

    let eventoAtivo =
            Evento [rockers, jazzBand, metalBand] Ativo

    let eventoEncerrado =
            Evento [jazzBand, metalBand] Encerrado

    let eventoCancelado =
            Evento [rockers, metalBand] Cancelado

    putStrLn "Evento Ativo:"
    putStrLn $ "Banda de abertura: " ++ bandaAbertura eventoAtivo
    putStrLn $ "Banda de encerramento: " ++ bandaEncerramento eventoAtivo
    putStrLn $ "Custo total: R$ " ++ show (custoTotalEvento eventoAtivo)

    putStrLn "\nEvento Encerrado:"
    putStrLn $ "Banda de abertura: " ++ bandaAbertura eventoEncerrado
    putStrLn $ "Banda de encerramento: " ++ bandaEncerramento eventoEncerrado
    putStrLn $ "Custo total: R$ " ++ show (custoTotalEvento eventoEncerrado)

    putStrLn "\nEvento Cancelado:"
    putStrLn $ "Banda de abertura: " ++ bandaAbertura eventoCancelado
    putStrLn $ "Banda de encerramento: " ++ bandaEncerramento eventoCancelado
    putStrLn $ "Custo total: R$ " ++ show (custoTotalEvento eventoCancelado)
