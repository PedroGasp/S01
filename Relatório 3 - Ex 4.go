package main
import "fmt"

func verificarLogin(usuario, senha string) bool {
	if usuario == "senha" && senha == "admin" {
		return true
	} else {
		return false
	}
}

func main() {
	var user, pass string

	for {
		fmt.Print("Digite o nome de usuário: ")
		fmt.Scanln(&user)

		fmt.Print("Digite a senha: ")
		fmt.Scanln(&pass)

		if verificarLogin(user, pass) {
			fmt.Println("Login bem-sucedido!")
			break 
		} else {
			fmt.Println("Usuário ou senha incorretos. Tente novamente.")
		}
	}
}
