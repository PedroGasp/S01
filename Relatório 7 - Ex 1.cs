using System;

class CombatenteAliado
{
    private string nome;
    private string linhagem;
    private string patente;

    public CombatenteAliado(string nome, string linhagem, string patente)
    {
        this.nome = nome;
        this.linhagem = linhagem;
        this.patente = patente;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine("Nome: " + nome);
        Console.WriteLine("Linhagem: " + linhagem);
        Console.WriteLine("Patente: " + patente);
        Console.WriteLine("-----------------------------");
    }
}

class Program
{
    static void Main(string[] args)
    {
        CombatenteAliado humano = new CombatenteAliado("Aragorn", "Humano", "Capitão");
        CombatenteAliado anao = new CombatenteAliado("Gimli", "Anão", "Guerreiro");
        CombatenteAliado elfo = new CombatenteAliado("Legolas", "Elfo", "Arqueiro");

        humano.ApresentarUnidade();
        anao.ApresentarUnidade();
        elfo.ApresentarUnidade();
    }
}
