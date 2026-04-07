#include <iostream>
#include <string>
using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    Pessoa(string n, int i) {
        nome = n;
        idade = i;
    }

    string getNome() {
        return nome;
    }

    int getIdade() {
        return idade;
    }

    void setNome(string n) {
        nome = n;
    }

    void setIdade(int i) {
        idade = i;
    }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string n, int i, int nv) : Pessoa(n, i) {
        nivel = nv;
    }

    int getNivel() {
        return nivel;
    }

    void setNivel(int nv) {
        nivel = nv;
    }

    void mostrar() {
        cout << "Protagonista:" << endl;
        cout << "Nome: " << getNome() << endl;
        cout << "Idade: " << getIdade() << endl;
        cout << "Nivel: " << nivel << endl;
        cout << endl;
    }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    Personagem(string n, int i, int r) : Pessoa(n, i) {
        if (r >= 0 && r <= 10)
            rank = r;
        else
            rank = 0; 
    }

    int getRank() {
        return rank;
    }

    void setRank(int r) {
        if (r >= 0 && r <= 10)
            rank = r;
    }

    void mostrar() {
        cout << "Personagem:" << endl;
        cout << "Nome: " << getNome() << endl;
        cout << "Idade: " << getIdade() << endl;
        cout << "Rank: " << rank << endl;
        cout << endl;
    }
};

int main() {
    Protagonista p1("Alexander", 17, 5);
    Personagem p2("Cleiton", 17, 7);

    p1.mostrar();
    p2.mostrar();

    p1.setNivel(10);
    p2.setRank(9);

    cout << "Atualizado:" << endl << endl;
    p1.mostrar();
    p2.mostrar();

    return 0;
}
