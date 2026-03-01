dim senha as string
dim resposta as string

senha = "1234"

input resposta

while resposta <> senha
    print "Senha incorreta! Tente novamente"
    input resposta
wend

print "Acesso Liberado!"