package main
import "fmt"

func fibonacci(n int) {
	a, b := 0, 1

	fmt.Printf("Sequência de Fibonacci (%d termos): ", n)

	for i := 0; i < n; i++ {
		fmt.Printf("%d ", a)
		a, b = b, a+b
	}
	fmt.Println()
}

func main() {
	var n int

	fmt.Print("Quantos números da sequencia você deseja ver? ")
	_, err := fmt.Scan(&n)

	if err != nil || n <= 0 {
		fmt.Println("Por favor, digite um número inteiro positivo.")
		return
	}

	fibonacci(n)
}
