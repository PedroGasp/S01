use std::io;

fn verificar_senha(senha: &str) -> bool {
    let mut numeros = 0;
    let mut maiuscula = false;

    if senha.len() < 10 {
        return false;
    }

    for c in senha.chars() {
        if c.is_digit(10) {
            numeros += 1;
        }

        if c.is_ascii_uppercase() {
            maiuscula = true;
        }
    }

    if numeros >= 2 && maiuscula {
        return true;
    }

    return false;
}

fn main() {
    loop {
        println!("Digite uma senha:");

        let mut senha = String::new();
        io::stdin().read_line(&mut senha).unwrap();

        let senha = senha.trim();

        if verificar_senha(senha) {
            println!("A senha é válida, seja bem vindo!");
            break;
        }
    }
}
