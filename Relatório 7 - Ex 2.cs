using System;
using System.Collections.Generic;

class CriaturaPokemon
{
    public string Especie;

    public CriaturaPokemon(string especie)
    {
        Especie = especie;
    }

    public virtual void ExecutarMovimento()
    {
        Console.WriteLine(Especie + " realiza um ataque genérico.");
    }
}

class TipoFogo : CriaturaPokemon
{
    public TipoFogo(string especie) : base(especie) { }

    public override void ExecutarMovimento()
    {
        Console.WriteLine(Especie + " lança uma rajada de chamas!");
    }
}

class TipoAgua : CriaturaPokemon
{
    public TipoAgua(string especie) : base(especie) { }

    public override void ExecutarMovimento()
    {
        Console.WriteLine(Especie + " dispara uma bolha de água!");
    }
}

class Program
{
    static void Main(string[] args)
    {
        List<CriaturaPokemon> lista = new List<CriaturaPokemon>();

        CriaturaPokemon scorbunny = new TipoFogo("Scorbunny");
        CriaturaPokemon greninja = new TipoAgua("Greninja");

        lista.Add(scorbunny);
        lista.Add(greninja);

        foreach (CriaturaPokemon pokemon in lista)
        {
            pokemon.ExecutarMovimento();
        }
    }
}
