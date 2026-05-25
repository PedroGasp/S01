import java.util.ArrayList;

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void virarPrato();
}

class Lagosta extends Monstro {

    public Lagosta(String nome) {
        super(nome);
    }

    @Override
    public void virarPrato() {
        System.out.println("Senshi prepara a lagosta grelhada com manteiga e ervas.");
    }
}

class Cogumelo extends Monstro {

    public Cogumelo(String nome) {
        super(nome);
    }

    @Override
    public void virarPrato() {
        System.out.println("Senshi prepara o cogumelo refogado com alho e cebola.");
    }
}

class Tempero {
    private String nome;
    private String quantidade;

    public Tempero(String nome, String quantidade) {
        this.nome = nome;
        this.quantidade = quantidade;
    }

    public void mostrarTempero() {
        System.out.println("Tempero: " + nome + " - Quantidade: " + quantidade);
    }
}

class Prato {
    private String nome;
    private Monstro monstro;
    private Tempero tempero;

    public Prato(String nome, Monstro monstro) {
        this.nome = nome;
        this.monstro = monstro;

        this.tempero = new Tempero("Sal", "1 colher");
    }

    public void servir() {
        System.out.println("\nPrato: " + nome);
        System.out.println("Ingrediente principal: " + monstro.getNome());

        monstro.virarPrato();

        tempero.mostrarTempero();
    }
}

public class Main {
    public static void main(String[] args) {

        Lagosta lagosta = new Lagosta("Lagosta Gigante");
        Cogumelo cogumelo = new Cogumelo("Cogumelo Andante");

        Prato prato1 = new Prato("Lagosta na Brasa", lagosta);
        Prato prato2 = new Prato("Cogumelo Refogado", cogumelo);

        prato1.servir();
        prato2.servir();

        ArrayList<Prato> cardapio = new ArrayList<>();

        cardapio.add(prato1);
        cardapio.add(prato2);

        System.out.println("\n=== CARDÁPIO DO DIA! Ou noite... ===");

        for (Prato prato : cardapio) {
            prato.servir();
        }
    }
}
