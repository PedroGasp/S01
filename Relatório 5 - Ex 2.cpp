#include <iostream>
using namespace std;

float multiplicaArray(float arr[], int tamanho) {
    float produto = 1;

    for (int i = 0; i < tamanho; i++) {
        produto *= arr[i];
    }

    return produto;
}

int main() {
    int tamanho;

    cout << "Tamanho do array? ";
    cin >> tamanho;

    float arr[tamanho];
    for (int i = 0; i < tamanho; i++) {
        cout << "Digite o valor " << i + 1 << ": ";
        cin >> arr[i];
    }

    float resultado = multiplicaArray(arr, tamanho);

    cout << "Resultado: " << resultado << endl;

    return 0;
}
