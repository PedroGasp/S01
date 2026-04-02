#include <iostream>
using namespace std;

int main() {
    float saldo;
    int op;
    float valor;

    cout << "Informe o saldo inicial: R$ ";
    cin >> saldo;

    do {
        cout << "\n===== MENU =====\n";
        cout << "1. Ver Saldo\n";
        cout << "2. Depositar\n";
        cout << "3. Sacar\n";
        cout << "4. Sair\n";
        cout << "Escolha uma opcao: ";
        cin >> op;

        switch (op) {
            case 1:
                cout << "Saldo atual: R$ " << saldo << endl;
                break;

            case 2:
                cout << "Digite o valor para deposito: R$ ";
                cin >> valor;
                saldo += valor;
                cout << "Deposito realizado!\n";
                break;

            case 3:
                cout << "Digite o valor para saque: R$ ";
                cin >> valor;
                if (valor > saldo) {
                    cout << "Saldo insuficiente!\n";
                } else {
                    saldo -= valor;
                    cout << "Saque realizado!\n";
                }
                break;

            case 4:
                cout << "Encerrando o programa...\n";
                break;

            default:
                cout << "Opcao invalida!\n";
        }

    } while (op != 4);

    return 0;
}
