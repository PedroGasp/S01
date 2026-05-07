class Hunter {
    constructor(nome) {
        this.nome = nome;
    }

    lutar() {
        console.log(`${this.nome} entrou em combate!`);
    }
}

class Gon extends Hunter {
    lutar() {
        console.log(`${this.nome} usou Jajanken!`);
    }
}

class Killua extends Hunter {
    lutar() {
        console.log(`${this.nome} ativou Godspeed!`);
    }
}

class Kurapika extends Hunter {
    lutar() {
        console.log(`${this.nome} atacou com suas correntes!️`);
    }
}

class TrupeFantasma {
    constructor(nome, membros) {
        this.nome = nome;
        this.membros = membros;
    }

    revelarMembros() {
        console.log(`=== ${this.nome} ===`);

        this.membros.forEach(membro => {
            console.log(membro);
        });
    }
}



const gon = new Gon("Gon");
const killua = new Killua("Killua");
const kurapika = new Kurapika("Kurapika");

gon.lutar();
killua.lutar();
kurapika.lutar();

console.log("--------------------------");

const trupe = new TrupeFantasma(
    "Trupe Fantasma",
    ["Chrollo", "Hisoka", "Feitan"]
);

trupe.revelarMembros();
