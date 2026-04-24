class Personagem:
    def __init__(self, vida, resistencia):
        self._vida = vida
        self._resistencia = resistencia

    @property
    def vida(self):
        return self._vida

    @vida.setter
    def vida(self, valor):
        if valor >= 0:
            self._vida = valor
        else:
            print("Vida não pode ser negativa.")

    def __str__(self):
        return f"Personagem com {self._vida} de vida e {self._resistencia} de resistência"


class Cavaleiro(Personagem):
    def __init__(self, vida, resistencia, armadura_pesada):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self):
        tipo_armadura = "com armadura pesada" if self.armadura_pesada else "sem armadura pesada"
        return f"Cavaleiro com {self._vida} de vida, {self._resistencia} de resistência e {tipo_armadura}"


p = Personagem(100, 50)
print(p)

c = Cavaleiro(150, 80, True)
print(c)

c.vida = 120
print(c.vida)
