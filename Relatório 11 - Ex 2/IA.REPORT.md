Identificação: Pedro Gasparotto Carvalho

Histórico de Prompts: Assim como o primeiro exercicio mandei imagens do problema para a IA resolver, como ela já sabia do que eu queria por conta do outro arquivo não dei nenhuma instrução extra.

Respostas Obtidas: Com certeza! Vamos ajudar o Sojiro a organizar o Leblanc usando Programação Orientada a Objetos em Java.

Aqui está a implementação completa dividida por classes, seguindo exatamente os requisitos de herança, sobrescrita e composição solicitados.

1. Classe Base: Cafe
Esta é a classe mãe. Como os atributos são privados, incluímos um construtor e os métodos getters, além do cálculo do preço base.

Java
public class Cafe {
    private String nome;
    private double preco;

    // Construtor
    public Cafe(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    // Getters
    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    // Método para calcular o preço final
    public double calcularPrecoFinal() {
        return this.preco;
    }
}
2. Herança e Sobrescrita: CafeGourmet
Esta classe herda de Cafe (extends) e adiciona a especificidade do bônus de aroma, sobrescrevendo o cálculo do preço.

Java
public class CafeGourmet extends Cafe {
    private double bonusAroma;

    // Construtor chamando o super
    public CafeGourmet(String nome, double preco, double bonusAroma) {
        super(nome, preco);
        this.bonusAroma = bonusAroma;
    }

    // Sobrescrita do método para somar o bônus ao preço base
    @Override
    public double calcularPrecoFinal() {
        return super.getPreco() + this.bonusAroma;
    }
}
3. Composição: Menu
Gerencia a lista de cafés utilizando um ArrayList.

Java
import java.util.ArrayList;

public class Menu {
    private ArrayList<Cafe> listaCafes;

    // Construtor instancia o ArrayList internamente
    public Menu() {
        this.listaCafes = new ArrayList<>();
    }

    // Método para adicionar café
    public void adicionarCafe(Cafe cafe) {
        this.listaCafes.add(cafe);
    }

    // Método para exibir o menu com for-each
    public void exibirMenu() {
        System.out.println("--- CARDÁPIO LEBLANC ---");
        for (Cafe cafe : listaCafes) {
            System.out.printf("- %s: R$ %.2f%n", cafe.getNome(), cafe.calcularPrecoFinal());
        }
    }
}
4. Composição Superior: CafeteriaLeblanc
Esta classe possui o Menu como um atributo interno. Para permitir a adição de cafés a partir da cafeteria (como pede o desafio na Main), adicionamos um método intermediário de repasse (adicionarCafeAoMenu).

Java
public class CafeteriaLeblanc {
    private Menu menu;

    // Construtor instancia o Menu internamente
    public CafeteriaLeblanc() {
        this.menu = new Menu();
    }

    // Método para facilitar a adição de cafés através da cafeteria
    public void adicionarCafeAoMenu(Cafe cafe) {
        this.menu.adicionarCafe(cafe);
    }

    // Método para abrir a cafeteria
    public void abrirCafeteria() {
        System.out.println("Bem-vindo ao Leblanc! Sente-se e aproveite o aroma do café.\n");
        this.menu.exibirMenu();
    }
}
5. Classe Executável: Main
Aqui juntamos tudo, instanciamos os cafés (simples e gourmet), adicionamos à cafeteria e abrimos as portas do Leblanc.

Java
public class Main {
    public static void main(String[] args) {
        // Instanciando a cafeteria
        CafeteriaLeblanc leblanc = new CafeteriaLeblanc();

        // Instanciando os cafés (sendo um deles Gourmet)
        Cafe cafeSimples = new Cafe("Café Tradicional Curto", 6.00);
        CafeGourmet cafeGourmet = new CafeGourmet("Leblanc Special Blend", 12.00, 3.50);
        Cafe cafeComLeite = new Cafe("Café com Leite", 7.50);

        // Adicionando os cafés ao menu através da cafeteria
        leblanc.adicionarCafeAoMenu(cafeSimples);
        leblanc.adicionarCafeAoMenu(cafeGourmet);
        leblanc.adicionarCafeAoMenu(cafeComLeite);

        // Abrindo a cafeteria
        leblanc.abrirCafeteria();
    }
}
☕ Saída Esperada no Console:
Plaintext
Bem-vindo ao Leblanc! Sente-se e aproveite o aroma do café.

--- CARDÁPIO LEBLANC ---
- Café Tradicional Curto: R$ 6,00
- Leblanc Special Blend: R$ 15,50
- Café com Leite: R$ 7,50

Relatório de Satisfação e Aprendizado: Assim que coloquei o código no one OneCompiler recebi várias mensagens de erros praticamento identicos mas em linhas diferentes.(Cafe.java:25: error: class CafeGourmet is public, should be declared in a file named CafeGourmet.java
public class CafeGourmet extends Cafe). Considerando isso, fica nítido que a IA fez o código com a intenção de ser colocado em arquivos separados ao invés de um só, o que resultou nesse erro. Percebi isso por causa, obviamente, da mensagem de erro e também da quantidade de 'public' em todas a funções principais, que não ocorreria problemas se estivessem em arquivos separados. Com isso em mente e usando o código do primeiro exercicio como 'guia', consegui consertar o problem tirando todos os 'public', exceto o 'public' da Main, resolvendo o problema e resultando na saída esperada. Não foi um problema dificil de resolver, mas mostra mais uma vez a importancia de olhar o código e compreeder os tipos de erros que podem aparecer quando é feito por IA.
