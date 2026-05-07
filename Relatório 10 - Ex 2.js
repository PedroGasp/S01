class Habilidade {
    usar() {
        throw new Error("O método usar() precisa ser sobrescrito!");
    }
}

class Smoke extends Habilidade {
    usar() {
        console.log("Usou Smoke: criando uma cortina de fumaça!");
    }
}

class Flash extends Habilidade {
    usar() {
        console.log("Usou Flash: cegando os inimigos!");
    }
}

class Dash extends Habilidade {
    usar() {
        console.log("Usou Dash: avançando rapidamente!");
    }
}

class Armadilha extends Habilidade {
    usar() {
        console.log("Usou Armadilha: protegendo a área!");
    }
}

class Agente {
    constructor(nome, funcao, habilidade) {
        this.nome = nome;
        this.funcao = funcao;
        this.habilidade = habilidade;
    }

    entrarEmCombate() {
        console.log(`Agente: ${this.nome}`);
        console.log(`Função: ${this.funcao}`);
        this.habilidade.usar();
        console.log("----------------------");
    }
}

class Time {
    constructor(agentes) {
        this.agentes = agentes;
    }

    iniciarPartida() {
        this.agentes.forEach(agente => {
            agente.entrarEmCombate();
        });
    }

    listarControladores() {
        return this.agentes.filter(agente =>
            agente.habilidade instanceof Smoke
        );
    }
}

const omen = new Agente("Omen", "Controlador", new Smoke());
const skye = new Agente("Skye", "Iniciador", new Flash());
const jett = new Agente("Jett", "Duelista", new Dash());
const cypher = new Agente("Cypher", "Sentinela", new Armadilha());

const time = new Time([omen, skye, jett, cypher]);

time.iniciarPartida();

console.log("=== Controladores ===");

const controladores = time.listarControladores();

controladores.forEach(agente => {
    console.log(agente.nome);
});
