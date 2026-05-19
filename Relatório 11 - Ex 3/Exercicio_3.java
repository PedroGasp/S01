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
        this.intensidade = intensidade;
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

        Alien alien1 = new Alien("Zorgon", "Feixe de Plasma", 85, "X-42");
        Alien alien2 = new Alien("Xylar", "Controle Mental", 90, "Andrômeda B");

        Youkai youkai1 = new Youkai("Kitsune", "Ilusão de Fogo", 75, "Kyoto Oculta");
        Youkai youkai2 = new Youkai("Kappa", "Manipulação Aquática", 60, "Rio Sumida");

        System.out.println("--- INICIANDO REGISTROS ---");

        registro.registrarEntidade(alien1);
        registro.registrarEntidade(alien2);
        registro.registrarEntidade(youkai1);
        registro.registrarEntidade(youkai2);

        System.out.println("\n--- TENTATIVA DE DUPLICAÇÃO ---");
        // Tentar registrar um deles duas vezes para demonstrar o bloqueio
        registro.registrarEntidade(alien1);

        registro.listarEntidades();
    }
}
