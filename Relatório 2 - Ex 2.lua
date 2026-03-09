local numeros = {}

print("Digite a quantidade de valores: ")
local N = tonumber(io.read())

for i = 1, N do
    print("Digite o valor " .. i .. ": ")
    numeros[i] = tonumber(io.read())
end

local maior = numeros[1]

for i = 2, N do
    if numeros[i] > maior then
        maior = numeros[i]
    end
end

print("O maior valor é: " .. maior)