function soma(a, b)
    return a + b
end

function subtracao(a, b)
    return a - b
end

function multiplicacao(a, b)
    return a * b
end

function divisao(a, b)
    if b == 0 then
        return "Erro: divisão por zero"
    end
    return a / b
end

function calculadora(a, b, operador)
    if operador == "+" then
        return soma(a, b)

    elseif operador == "-" then
        return subtracao(a, b)

    elseif operador == "*" then
        return multiplicacao(a, b)

    elseif operador == "/" then
        return divisao(a, b)

    else
        return "Erro: operador inválido"
    end
end


-- Programa principal
print("Digite o primeiro número: ")
n1 = tonumber(io.read())

print("Digite o operador (+ - * /): ")
op = io.read()

print("Digite o segundo número: ")
n2 = tonumber(io.read())

resultado = calculadora(n1, n2, op)

print("Resultado:", resultado)