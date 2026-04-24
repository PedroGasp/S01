from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass

class Tanque(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} ativa o ultimate: cria uma barreira massiva para proteger a equipe!")

class Dano(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} ativa o ultimate: causa dano devastador em todos os inimigos!")


class Suporte(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Suporte")

    def usar_ultimate(self):
        print(f"{self.nome} ativa o ultimate: cura e fortalece todos os aliados!")


if __name__ == "__main__":
    herois = []

    herois.append(Tanque("Reinhardt"))
    herois.append(Dano("Tracer"))
    herois.append(Suporte("Mercy"))

    for heroi in herois:
        heroi.usar_ultimate()
