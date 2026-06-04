Identificação: Pedro Gasparotto Carvalho - 655

Histórico de Prompts: Em Haskell, como que faço para pegar a ultima informação dentro de uma tabela ?, Mandei uma imagem do exercicio e perguntei: Mas nesse caso, como eu faço para pegar a banda de encerramento ?

Respostas Obtidas: Em Haskell, o que você está chamando de "tabela" geralmente é representado como uma lista (se for uma coleção simples de elementos) ou uma lista de tuplas/registros (se for uma tabela com linhas e colunas).

Dependendo da estrutura exata dos seus dados, aqui estão as formas mais comuns de pegar o último elemento:

1. Se a sua tabela for uma Lista Simples
Se você tem uma lista linear de dados e quer apenas o último elemento, a função nativa last resolve o problema direto.

Haskell
-- Uma lista simples de números ou strings

let tabela = [10, 20, 30, 42]
last tabela -- Retorna: 42

⚠️ Atenção: A função last vai quebrar o programa com um erro se a lista estiver vazia. Se houver chance de a sua tabela estar vazia, o jeito mais seguro (Haskell-way) é usar Pattern Matching ou a função safeTail de algumas bibliotecas.

2. Se a sua tabela for uma Lista de Linhas (Tuplas)
Se a sua tabela tem colunas (por exemplo: ID, Nome, Nota) e você quer a última linha inteira, o last ainda funciona perfeitamente, pois ele olha para o último item da lista principal.

Haskell
-- Uma tabela de alunos: (ID, Nome, Nota)
let tabelaAlunos = [(1, "Ana", 9.5), (2, "Bob", 8.0), (3, "Carlos", 10.0)]


-- Pega a última linha (tupla) inteira
last tabelaAlunos -- Retorna: (3, "Carlos", 10.0)
3. Se você quer um valor específico da última linha
Se além de pegar a última linha, você quiser extrair um dado específico dela (como apenas o nome do último aluno), você pode combinar o last com funções de extração de tuplas ou pattern matching:


Usando funções auxiliares:
Haskell
let ultimaLinha = last tabelaAlunos

-- Se for uma tupla de 2 elementos (par), use 'snd' para o segundo elemento
-- Como nossa tupla tem 3 elementos, podemos criar uma função rápida ou usar pattern matching:
let (_, nome, _) = last tabelaAlunos
print nome -- Retorna: "Carlos"
Criando uma função limpa para isso:
Haskell
-- Função que recebe a tabela e retorna o nome do último elemento
obterUltimoNome :: [(Int, String, Double)] -> String
obterUltimoNome [] = "Tabela vazia!"
obterUltimoNome xs = let (_, nome, _) = last xs in nome

----------------------------------------------------------------------

Ah, excelente! Agora com o enunciado do exercício faz todo o sentido do porquê você precisava do "último elemento". O que o exercício chama de "tabela", na verdade, é a lista de bandas dentro do tipo Evento.

Como o próprio enunciado pede para usar pattern matching para verificar se a lista está vazia e a função last para pegar o último elemento caso ela tenha bandas, você pode estruturar a função bandaEncerramento dessa forma:

Implementando a função bandaEncerramento
Primeiro, vamos lembrar de como o tipo Evento é estruturado (provavelmente usando a sintaxe de registros para facilitar o acesso aos campos):

Haskell
-- Definição dos tipos baseado no seu exercício
data Banda = Banda { nome :: String, genero :: String, cache :: Double } deriving (Show)
data StatusEvento = Ativo | Encerrado | Cancelado deriving (Show, Eq)
data Evento = Evento { bandas :: [Banda], status :: StatusEvento } deriving (Show)
Para extrair a banda de encerramento, fazemos o pattern matching diretamente no construtor do Evento para pegar a lista de bandas:

Haskell
bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _) = "O evento não possui bandas!" -- Caso a lista esteja vazia
bandaEncerramento (Evento listaBandas _) = nome (last listaBandas)   -- Caso tenha bandas, pega o nome da última
Explicando o passo a passo:
bandaEncerramento (Evento [] _): Se o evento for criado com uma lista vazia [], o Haskell entra nessa primeira linha e já retorna a mensagem de aviso (o _ significa que não importa o status do evento para essa checagem). Isso evita que o programa quebre.

bandaEncerramento (Evento listaBandas _): Se a lista tiver qualquer elemento, o Haskell cai nessa segunda linha.

last listaBandas: Pega o último objeto do tipo Banda dentro da lista.

nome (...): Como last retorna uma Banda inteira, usamos a função extratora nome (que o Haskell cria automaticamente quando definimos o tipo usando chaves) para pegar apenas o texto com o nome dela.

Dica extra: A Banda de Abertura
Seguindo a mesma lógica matemática e de pattern matching exigida pelo exercício, a de abertura (que pega o primeiro elemento) ficaria bem parecida, mas usando o operador : (head/tail) ou a função head:

Haskell
bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _)    = "O evento não possui bandas!"
bandaAbertura (Evento (b:_) _) = nome b -- 'b' é a primeira banda da lista

Relatório de Satisfação e Aprendizado: Assim como o outro, os valores que eu podia trocar por outras deixou o exercicio um pouco mais fácil, porem tive alguns problemas na parte de pegar o último evendo, então usei a IA pra poder entender como fazer essa parte e conseguir fazer o resto do exercicio. A IA teve alguns problemas em enteder meu problema então tive que mandar o contexto de exercico para conseguir uma resposta mais especifica.
