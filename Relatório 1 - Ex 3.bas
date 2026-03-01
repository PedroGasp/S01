dim reais as integer
dim conversao as single

input "Digite quantos reais voce tem: ", reais
conversao = reais

print "Convertendo..."

print "Seu dinheiro em Reais: ", reais
print "Em Dolar: "; USING "##.##"; conversao/5
print "Em Euro: "; USING "##.##"; conversao/5.40
sleep
