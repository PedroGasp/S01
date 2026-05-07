class Criatura {
    constructor(nome, perigo) {
        this.nome = nome;
        this.perigo = perigo;
    }
}

class Diario {
    constructor() {
        this.criaturas = [];
    }

    registrarCriatura(criatura) {
        this.criaturas.push(criatura);
    }

    listarCriaturas() {
        console.log("=== Criaturas Registradas ===");

        this.criaturas.forEach(criatura => {
            console.log(
                `${criatura.nome} - Perigo: ${criatura.perigo}`
            );
        });
    }
}

class Personagem {
    constructor(nome) {
        this.nome = nome;
    }
}

class CabanaMisterio {
    constructor(personagens) {
        this.personagens = personagens;
    }

    listarFuncionarios() {
        console.log("=== Funcionários da Cabana do Mistério ===");

        this.personagens.forEach(personagem => {
            console.log(personagem.nome);
        });
    }
}



const diario3 = new Diario();

const gnomos = new Criatura("Gnomos", "Médio");
const billCipher = new Criatura("Bill Cipher", "Extremo");
const monstroLago = new Criatura("Monstro do Lago", "Alto");

diario3.registrarCriatura(gnomos);
diario3.registrarCriatura(billCipher);
diario3.registrarCriatura(monstroLago);

diario3.listarCriaturas();

console.log("------------------------");

const stan = new Personagem("Grunkle Stan");
const mabel = new Personagem("Mabel");
const soos = new Personagem("Soos");

const cabana = new CabanaMisterio([stan, mabel, soos]);

cabana.listarFuncionarios();
