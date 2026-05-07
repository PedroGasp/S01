class Pokemon {
    #vida;

    constructor(nome, tipo, vida) {
        this.nome = nome;
        this.tipo = tipo;
        this.#vida = vida;
    }

    get vida() {
        return this.#vida;
    }

    atacar() {
        console.log(`${this.nome} atacou!`);
    }

    receber_dano(dano) {
        this.#vida -= dano;

        if (this.#vida < 0) {
            this.#vida = 0;
        }
    }
}

class Pikachu extends Pokemon {
    constructor(nome, vida) {
        super(nome, "Elétrico", vida);
    }

    atacar() {
        console.log(`${this.nome} usou Choque do Trovão!`);
    }
}

class Charizard extends Pokemon {
    constructor(nome, vida) {
        super(nome, "Fogo", vida);
    }

    atacar() {
        console.log(`${this.nome} usou Lança-Chamas!`);
    }
}

const pikachu = new Pikachu("Pikachu", 100);
const charizard = new Charizard("Charizard", 150);

pikachu.atacar();
charizard.atacar();

charizard.receber_dano(40);
pikachu.receber_dano(50)

console.log(`Vida do ${charizard.nome}: ${charizard.vida}`);
console.log(`Vida do ${pikachu.nome}: ${pikachu.vida}`);
