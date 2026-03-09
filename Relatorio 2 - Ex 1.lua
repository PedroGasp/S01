print("Digite o valor de inicio:")
local M = tonumber(io.read())
print("Digite o valor de fim:")
local N = tonumber(io.read())
print("Digite um valor para fazer a tabuada: ")
local X = tonumber(io.read())
if M and N then
    if M <= N then
      for i = M, N do
      print(X .. " x " .. i .. " = " .. X*i)
      end
    else
      print("O valor de inicio tem que ser menor que o valor de fim.")
    end
else
    print("Entrada invalida! Digite apenas numeros.")
end
