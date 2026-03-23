package main
import "fmt"

func main() {
	var a, b, c int

	fmt.Println("Digite os três lados do triângulo:")
	fmt.Scan(&a, &b, &c)

	if a+b > c && a+c > b && b+c > a {
		
		switch {
		case a == b && b == c:
			fmt.Println("Triângulo Equilátero.")
		case a == b || a == c || b == c:
			fmt.Println("Triângulo Isósceles.")
		default:
			fmt.Println("Triângulo Escaleno.")
		}

	} else {
		fmt.Println("Erro: Os valores informados nao formar um triangulo.")
	}
}
