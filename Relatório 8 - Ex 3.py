class ArmaCorpoACorpo:
    def __init__(self, nome):
        self.nome = nome

    def __str__(self):
        return f"Arma: {self.nome}"

class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} usa {self.arma}"


class Joker:
    def __init__(self, nome_arma, equipe):
        self.arma = ArmaCorpoACorpo(nome_arma)

        self.equipe = equipe

    def mostrar_equipe(self):
        print("Equipe Phantom Thieves:")
        for membro in self.equipe:
            print(membro)


if __name__ == "__main__":
    m1 = PhantomThieves("Ryuji", "Imprisoned Mjolnir")
    m2 = PhantomThieves("Ann", "Dainaraka Whip")
    m3 = PhantomThieves("Makoto", "Vajra")

    equipe = [m1, m2, m3]

    joker = Joker("Punish Dagger", equipe)

    joker.mostrar_equipe()

    print("Joker usa:", joker.arma)
