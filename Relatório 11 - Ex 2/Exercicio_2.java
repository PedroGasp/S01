import java.util.ArrayList;

class Cafe {
    private String nome;
    private double preco;

    public Cafe(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double calcularPrecoFinal() {
        return this.preco;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double preco, double bonusAroma) {
        super(nome, preco);
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return super.getPreco() + this.bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> listaCafes;

    public Menu() {
        this.listaCafes = new ArrayList<>();
    }

    public void adicionarCafe(Cafe cafe) {
        this.listaCafes.add(cafe);
    }

    public void exibirMenu() {
        System.out.println("--- CARDÁPIO LEBLANC ---");
        for (Cafe cafe : listaCafes) {
            System.out.printf("- %s: R$ %.2f%n", cafe.getNome(), cafe.calcularPrecoFinal());
        }
    }
}

class CafeteriaLeblanc {
    private Menu menu;

    public CafeteriaLeblanc() {
        this.menu = new Menu();
    }

    public void adicionarCafeAoMenu(Cafe cafe) {
        this.menu.adicionarCafe(cafe);
    }

    public void abrirCafeteria() {
        System.out.println("Bem-vindo ao Leblanc! Sente-se e aproveite o aroma do café.\n");
        this.menu.exibirMenu();
    }
}

public class Main {
    public static void main(String[] args) {
        CafeteriaLeblanc leblanc = new CafeteriaLeblanc();

        Cafe cafeSimples = new Cafe("Café Tradicional Curto", 6.00);
        CafeGourmet cafeGourmet = new CafeGourmet("Leblanc Special Blend", 12.00, 3.50);
        Cafe cafeComLeite = new Cafe("Café com Leite", 7.50);

        leblanc.adicionarCafeAoMenu(cafeSimples);
        leblanc.adicionarCafeAoMenu(cafeGourmet);
        leblanc.adicionarCafeAoMenu(cafeComLeite);

        leblanc.abrirCafeteria();
    }
}
