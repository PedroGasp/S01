use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let npt = (nota1 + nota2) / 2.0;
    let npl = nota3;

    let media_final = (npt * 0.7) + (npl * 0.3);

    if npt >= 60.0 && npl >= 60.0 {
        println!("Parabéns! Você foi aprovado.");
    } else {
        println!("Você foi reprovado.");
    }

    return media_final;
}

fn main() {

    let mut entrada = String::new();

    println!("Digite a nota NP1:");
    io::stdin().read_line(&mut entrada).unwrap();
    let nota1: f64 = entrada.trim().parse().unwrap();

    entrada.clear();

    println!("Digite a nota NP2:");
    io::stdin().read_line(&mut entrada).unwrap();
    let nota2: f64 = entrada.trim().parse().unwrap();

    entrada.clear();

    println!("Digite a nota NPL:");
    io::stdin().read_line(&mut entrada).unwrap();
    let nota3: f64 = entrada.trim().parse().unwrap();

    let media = calcular_media(nota1, nota2, nota3);

    println!("Média final: {}", media);
}
