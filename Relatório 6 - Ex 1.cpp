#include <iostream>
#include <string>
using namespace std;

class Robo {
private:
    string modelo;
    int versao;
    float potenciaLaser;
    int integridade;

public:

    Robo(string m, int v, float p, int i) {
        modelo = m;
        versao = v;
        potenciaLaser = p;
        integridade = i;
    }

    void disparar(Robo &alvo) {
        cout << modelo << " disparou em " << alvo.modelo << "!" << endl;
        
        alvo.integridade -= potenciaLaser;

        if (alvo.integridade < 0) {
            alvo.integridade = 0;
        }
    }

    void mostrarStatus() {
        cout << "Modelo: " << modelo << endl;
        cout << "Versao: " << versao << endl;
        cout << "Potencia do Laser: " << potenciaLaser << endl;
        cout << "Integridade: " << integridade << endl;
        cout << endl;
    }
    
    int getIntegridade() {
      return integridade;
    }
    
    string getModelo() {
      return modelo;
    }
};

int main() {
    Robo robo1("Maddog", 1, 35.5, 100);
    Robo robo2("Crucible", 2, 25.0, 120);

    cout << "Status inicial:\n";
    robo1.mostrarStatus();
    robo2.mostrarStatus();

    robo1.disparar(robo2);
    robo2.disparar(robo1);

    cout << "\nStatus apos o ataque:\n";
    robo1.mostrarStatus();
    robo2.mostrarStatus();
    
    if (robo1.getIntegridade() == 0){
      cout << robo2.getModelo() << " Explodiu " << robo1.getModelo() << "!!!" << endl;
    }
    
    if (robo2.getIntegridade() == 0){
      cout << robo1.getModelo() << " Explodiu " << robo2.getModelo() << "!!!" << endl;
    }

    return 0;
}
