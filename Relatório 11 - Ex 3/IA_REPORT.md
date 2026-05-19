Identificação: Pedro Gasparotto Carvalho

Histórico de Prompts: Pequei o contexto geral do problema e pedi pra IA tentar gerar um código, dessa explicando que é pra ser apenas um arquivo ao invés de vários.

Respostas Obtidas: 
Para resolver este desafio em um único arquivo de código em Java, utilizaremos uma classe principal pública (Main) e colocaremos as demais interfaces e classes no mesmo arquivo sem o modificador public (classes com escopo de pacote).

Para que o RegistroOculto consiga chamar o método obterCoordenadas ao percorrer as entidades no HashMap<String, Entidade>, precisamos fazer um pequeno ajuste de polimorfismo: faremos um cast (conversão) da Entidade para Rastreavel ou faremos a classe base Entidade implementar a interface Rastreavel. Seguiremos a modelagem indicada fazendo o cast seguro ou garantindo que as subclasses sejam tratadas como rastreáveis.

Aqui está o código completo pronto para rodar:

Java
import java.util.HashMap;
import java.util.Map;

// ==========================================
// INTERFACE
// ==========================================
interface Rastreavel {
    String obterCoordenadas();
}

// ==========================================
// COMPOSIÇÃO: CLASSE PODER
// ==========================================
class Poder {
    private String nome;
    private int intensidade;

    public Poder(String nome, int intensidade) {
        this.nome = nome;
        this.intensidade = intensity;
    }

    public String getNome() {
        return nome;
    }
}

// ==========================================
// CLASSE BASE: ENTIDADE
// ==========================================
class Entidade {
    private String nome;

    public Entidade(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

// ==========================================
// SUBCLASSES (HERANÇA E INTERFACE)
// ==========================================
class Alien extends Entidade implements Rastreavel {
    private Poder poder;
    private String quadranteEstelar;

    public Alien(String nome, String nomePoder, int intensidadePoder, String quadranteEstelar) {
        super(nome);
        // O componente Poder nasce e existe estritamente dentro da entidade (Composição)
        this.poder = new Poder(nomePoder, intensidadePoder);
        this.quadranteEstelar = quadranteEstelar;
    }

    @Override
    public String obterCoordenadas() {
        return "Quadrante Galáctico " + quadranteEstelar;
    }
}

class Youkai extends Entidade implements Rastreavel {
    private Poder poder;
    private String regiaoEspiritual;

    public Youkai(String nome, String nomePoder, int intensidadePoder, String regiaoEspiritual) {
        super(nome);
        // O componente Poder nasce e existe estritamente dentro da entidade (Composição)
        this.poder = new Poder(nomePoder, intensidadePoder);
        this.regiaoEspiritual = regiaoEspiritual;
    }

    @Override
    public String obterCoordenadas() {
        return "Plano Espiritual - Região " + regiaoEspiritual;
    }
}

// ==========================================
// AGREGAÇÃO COM HASHMAP
// ==========================================
class RegistroOculto {
    private HashMap<String, Entidade> mapaEntidades;

    public RegistroOculto() {
        this.mapaEntidades = new HashMap<>();
    }

    public void registrarEntidade(Entidade entidade) {
        // Verifica se a chave (nome) já existe no mapa
        if (mapaEntidades.containsKey(entidade.getNome())) {
            System.out.println("[AVISO] A entidade '" + entidade.getNome() + "' já foi registrada e não pode ser duplicada!");
        } else {
            mapaEntidades.put(entidade.getNome(), entidade);
            System.out.println("[SUCESSO] " + entidade.getNome() + " registrado no sistema.");
        }
    }

    public void listarEntidades() {
        System.out.println("\n--- LISTA DE ENTIDADES RASTREADAS ---");
        // Percorre o HashMap usando for-each nas entradas (Key-Value)
        for (Map.Entry<String, Entidade> entrada : mapaEntidades.entrySet()) {
            Entidade entidade = entrada.getValue();
            
            // Verifica se a entidade implementa Rastreavel para chamar o método com segurança
            if (entidade instanceof Rastreavel) {
                Rastreavel rastreavel = (Rastreavel) entidade;
                System.out.println("Nome: " + entidade.getNome() + " | Coordenadas: " + rastreavel.obterCoordenadas());
            }
        }
    }
}

// ==========================================
// CLASSE PRINCIPAL EXECUTÁVEL
// ==========================================
public class Main {
    public static void main(String[] args) {
        RegistroOculto registro = new RegistroOculto();

        // Instanciando dois Aliens
        Alien alien1 = new Alien("Zorgon", "Feixe de Plasma", 85, "X-42");
        Alien alien2 = new Alien("Xylar", "Controle Mental", 90, "Andrômeda B");

        // Instanciando dois Youkais
        Youkai youkai1 = new Youkai("Kitsune", "Ilusão de Fogo", 75, "Kyoto Oculta");
        Youkai youkai2 = new Youkai("Kappa", "Manipulação Aquática", 60, "Rio Sumida");

        System.out.println("--- INICIANDO REGISTROS ---");
        // Registrar as entidades
        registro.registrarEntidade(alien1);
        registro.registrarEntidade(alien2);
        registro.registrarEntidade(youkai1);
        registro.registrarEntidade(youkai2);

        System.out.println("\n--- TENTATIVA DE DUPLICAÇÃO ---");
        // Tentar registrar um deles duas vezes para demonstrar o bloqueio
        registro.registrarEntidade(alien1);

        // Listar os resultados finais
        registro.listarEntidades();
    }
}

Relatório de Satisfação e Aprendizado: Mais uma vez a IA entregou um código que não roda de maneira correta, quando coloquei no OneCompile para verificar o código surgiu um erro (Main.java:20: error: cannot find symbol
        this.intensidade = intensity;
                           ^
  symbol:   variable intensity
  location: class Poder), por algum motivo a IA decidiu colocar o nome em ingles ao invés de seguir o padrão do nome por exemplo. Coloquei Intensidade ao invés de 'intensity', o que arrumou o problema, além de alguns pequenos ajustes como a remoção de comentários desnecessário. Fiquei confuso com o uso de HashMap e a utilidade da biblioteca no código em geral mesmo após ter assistido o vídeo, então perguntei para a IA para falar mais sobre o seu funcionamento e em que situações usar. De resto o código seguiu o mesmo padrão dos anteriores e a legilibilade facilou o entendimento do código e checagem se está conforme o que o exercicio pede. Queria ter colocado o poder de cada criatura na lista, contudo como o exercicio não pede, não coloquei. 
