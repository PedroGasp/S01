package main
import "fmt"

func ValidarUsuario(nome string) (bool, string) {
	if len(nome) >= 8 {
		return true, "Usuário criado com sucesso!"
	}
	return false, "Erro: O nome de usuário é muito curto"
}

func main() {
	var entrada string
	var valido bool
	var mensagem string

	for {
		fmt.Print("Digite o nome de usuário: ")
		fmt.Scanln(&entrada)

		valido, mensagem = ValidarUsuario(entrada)

		if valido {
			fmt.Println(mensagem)
			break 
		} else {
			fmt.Println(mensagem)
			fmt.Println("Tente novamente.")
		}
	}
}
