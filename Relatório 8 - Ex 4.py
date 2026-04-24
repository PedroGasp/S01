from abc import ABC, abstractmethod

class Cibernetico(ABC):

    @abstractmethod
    def realizar_hack(self):
        pass

class Implante:
    def __init__(self, custo, funcao):
        self.custo = custo
        self.funcao = funcao

    def __str__(self):
        return f"Implante ({self.funcao}) - Custo: {self.custo}"

class NetRunner(Cibernetico):
    def __init__(self, nome, custo_implante, funcao_implante):
        self.nome = nome
        
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self):
        print(f"{self.nome} usa {self.implante.funcao}!")

class Faccao:
    def __init__(self, membros):
        self.membros = membros  # lista de Cibernetico

    def executar_hacks(self):
        print("Facção iniciando ataques...")
        for membro in self.membros:
            membro.realizar_hack()

if __name__ == "__main__":
    n1 = NetRunner("V", 5000, "Invasão Neural")
    n2 = NetRunner("Lucy", 7000, "Quebra de Firewall")
    n3 = NetRunner("T-Bug", 6500, "Controle de Sistemas")

    faccao = Faccao([n1, n2, n3])

    faccao.executar_hacks()
