#include <iostream>
#include <string>
using namespace std;

class MembroConselho {
protected:
    string nome;

public:
    MembroConselho(string n) {
        nome = n;
    }

    virtual void saudar() {
        cout << "Um membro do conselho faz uma reverência silenciosa." << endl;
    }

    virtual ~MembroConselho() {}
};

class Anao : public MembroConselho {
public:
    Anao(string n) : MembroConselho(n) {}

    void saudar() override {
        cout << "Pela força da montanha, eu sou "
             << nome << " e honro nosso aço!" << endl;
    }
};


class Orc : public MembroConselho {
public:
    Orc(string n) : MembroConselho(n) {}

    void saudar() override {
        cout << "Pelo sangue e glória, eu sou "
             << nome << " e trago a força de minha tribo!" << endl;
    }
};

class Draconato : public MembroConselho {
public:
    Draconato(string n) : MembroConselho(n) {}

    void saudar() override {
        cout << "Pelo sopro dos ancestrais, eu sou "
             << nome << " e falo em nome dos dragões!" << endl;
    }
};

int main() {
    MembroConselho* conselho[3];

    conselho[0] = new Anao("Durnak");
    conselho[1] = new Orc("Grommash");
    conselho[2] = new Draconato("Argon");

    for (int i = 0; i < 3; i++) {
        conselho[i]->saudar();
    }

    for (int i = 0; i < 3; i++) {
        delete conselho[i];
    }

    return 0;
}
