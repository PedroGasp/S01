local numeros = {}
local impares = {}

print("Digite a quantidade de valores: ")
local N = tonumber(io.read())


for i = 1, N do
    print("Digite o valor " .. i .. ": ")
    numeros[i] = tonumber(io.read())
end


local j = 1
for i = 1, N do
    if numeros[i] % 2 ~= 0 then
        impares[j] = numeros[i]
        j = j + 1
    end
end


print("Números ímpares:")
for i = 1, #impares do
    print(impares[i])
end