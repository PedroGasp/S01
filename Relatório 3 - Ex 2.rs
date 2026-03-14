use std::io;

fn eh_impar(numero: i32) -> bool {
    if numero % 2 != 0 {
        return true;
    } else {
        return false;
    }
}

fn main() {

    let mut escolha = String::new();
    let mut entrada = String::new();

    println!("Jogador 1 escolha 'par' ou 'impar':");
    io::stdin().read_line(&mut escolha).unwrap();

    println!("Jogador 1 digite um numero:");
    io::stdin().read_line(&mut entrada).unwrap();
    let num1: i32 = entrada.trim().parse().unwrap();

    entrada.clear();

    println!("Jogador 2 digite um numero:");
    io::stdin().read_line(&mut entrada).unwrap();
    let num2: i32 = entrada.trim().parse().unwrap();

    let soma = num1 + num2;

    let soma_impar = eh_impar(soma);

    println!("A soma dos numeros é: {}", soma);

    if escolha.trim() == "impar" {
        if soma_impar {
            println!("Jogador 1 venceu!");
        } else {
            println!("Jogador 2 venceu!");
        }
    } else {
        if soma_impar {
            println!("Jogador 2 venceu!");
        } else {
            println!("Jogador 1 venceu!");
        }
    }
}
