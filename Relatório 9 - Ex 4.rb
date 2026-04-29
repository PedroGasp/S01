module Localizavel
  def local_atual
    puts "#{@nome} está em #{@localizacao}."
  end
end

module Perigoso
  def exibir_ameaca
    puts "⚠️ #{@nome} representa perigo!"
  end
end

class Pessoa
  attr_accessor :nome, :localizacao

  def initialize(nome, localizacao)
    @nome = nome
    @localizacao = localizacao
  end
end

class Testemunha < Pessoa
  include Localizavel
end

class Suspeito < Pessoa
  include Localizavel
  include Perigoso
end

class CenaDoCrime
  def initialize
    @pessoas = []
  end

  def adicionar_pessoa(pessoa)
    @pessoas << pessoa
  end

  def listar_todos
    @pessoas.each do |p|
      puts "Nome: #{p.nome}"
    end
  end

  def identificar_perigosos
    @pessoas.select { |p| p.respond_to?(:exibir_ameaca) }
  end
end

cena = CenaDoCrime.new

t1 = Testemunha.new("John Watson", "Baker Street")
s1 = Suspeito.new("James Moriarty", "Beco Escuro")
s2 = Suspeito.new("Irene Adler", "Hotel Luxuoso")

cena.adicionar_pessoa(t1)
cena.adicionar_pessoa(s1)
cena.adicionar_pessoa(s2)

puts "Todos na cena:"
cena.listar_todos

puts "\nLocalizações:"
[t1, s1, s2].each { |p| p.local_atual }

puts "\nPerigosos identificados:"
perigosos = cena.identificar_perigosos
perigosos.each do |p|
  p.exibir_ameaca
end
