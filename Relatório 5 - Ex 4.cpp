#include <iostream>
using namespace std;

int main() {
    int sala[5][5] = {0};
    int op;
    int f, c;
    int ocupados = 0, vazios = 0;

    while (true) {
        cout << "\n===== MENU =====\n";
        cout << "1. Reservar Assento\n";
        cout << "2. Ver Mapa da Sala\n";
        cout << "3. Sair\n";
        cout << "Escolha uma opcao: ";
        cin >> op;

        if (op == 1) {
            cout << "Digite a fileira (0-4): ";
            cin >> f;
            cout << "Digite a coluna (0-4): ";
            cin >> c;

            if (f >= 0 && f < 5 && c >= 0 && c < 5) {
                if (sala[f][c] == 0) {
                    sala[f][c] = 1;
                    cout << "Sucesso!\n";
                } else {
                    cout << "Erro: Assento ocupado!\n";
                }
            } else {
                cout << "Posicao invalida!\n";
            }
        }
        else if (op == 2) {
            cout << "\nMapa da Sala:\n";
            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 5; j++) {
                    cout << "[" << sala[i][j] << "] ";
                }
                cout << endl;
            }
        }
        else if (op == 3) {
            break;
        }
        else {
            cout << "Opcao invalida!\n";
        }
    }

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (sala[i][j] == 1)
                ocupados++;
            else
                vazios++;
        }
    }

    cout << "Assentos ocupados: " << ocupados << endl;
    cout << "Assentos vazios: " << vazios << endl;

    return 0;
}
