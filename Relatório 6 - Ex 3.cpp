#include <iostream>
#include <string>
using namespace std;

class MembroInatel {
protected:
    string nomeCompleto;

public:
    MembroInatel(string nome) {
        nomeCompleto = nome;
    }

    virtual void identificar() {
        cout << "Sou um membro da comunidade Inatel: " 
             << nomeCompleto << "." << endl;
    }

    virtual ~MembroInatel() {}
};

class Coordenador : public MembroInatel {
private:
    string departamento;

public:
    Coordenador(string nome, string dept)
        : MembroInatel(nome) {
        departamento = dept;
    }

    void identificar() override {
        cout << "Ola! Meu nome é " << nomeCompleto 
             << ", sou o coordenador do departamento de " 
             << departamento << " no Inatel." << endl;
    }
};

class Pesquisador : public MembroInatel {
private:
    string laboratorio;

public:
    Pesquisador(string nome, string lab)
        : MembroInatel(nome) {
        laboratorio = lab;
    }

    void identificar() override {
        cout << "Oi! Meu nome é " << nomeCompleto 
             << ", e realizo pesquisas no laboratório " 
             << laboratorio << " do Inatel." << endl;
    }
};

int main() {
    MembroInatel* m1;
    MembroInatel* m2;

    m1 = new Coordenador("Ana Souza", "Engenharia");
    m2 = new Pesquisador("Carlos Lima", "Computação");

    m1->identificar();
    m2->identificar();

    delete m1;
    delete m2;

    return 0;
}
