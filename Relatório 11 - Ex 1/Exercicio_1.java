import java.util.ArrayList;

abstract class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public abstract void apresentar();
}

class Mago extends Personagem {

    public Mago(String nome, int idade) {
        super(nome, idade);
    }

    @Override
    public void apresentar() {
        System.out.println("Eu sou o mago " + getNome() + ", tenho " + getIdade() + " anos e posso criar Buracos Necros!");
    }
}

class Divisao {
    private String nome;
    private String funcao;

    public Divisao(String nome, String funcao) {
        this.nome = nome;
        this.funcao = funcao;
    }

    @Override
    public String toString() {
        return "Divisão: " + nome + " | Função: " + funcao;
    }
}

// Agregação
class CasteloAnimado {
    private ArrayList<Divisao> divisoes;

    public CasteloAnimado(ArrayList<Divisao> divisoes) {
        this.divisoes = divisoes;
    }

    public void adicionarDivisao(Divisao d) {
        divisoes.add(d);
    }

    public void listarDivisoes() {
        System.out.println("\nDivisões do Castelo:");

        for (Divisao d : divisoes) {
            System.out.println(d);
        }
    }
}

public class Main {
    public static void main(String[] args) {

        Mago howl = new Mago("Howl", 27);

        howl.apresentar();

        Divisao quarto = new Divisao("Quarto", "Descanso");
        Divisao laboratorio = new Divisao("Laboratório", "Experimentos mágicos");
        Divisao cozinha = new Divisao("Cozinha", "Preparar comida");

        ArrayList<Divisao> lista = new ArrayList<>();

        CasteloAnimado castelo = new CasteloAnimado(lista);

        castelo.adicionarDivisao(quarto);
        castelo.adicionarDivisao(laboratorio);
        castelo.adicionarDivisao(cozinha);

        castelo.listarDivisoes();
    }
}
