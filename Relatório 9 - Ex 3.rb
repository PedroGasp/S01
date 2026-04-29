class MicroondasTelefone
  def ativar
    puts "Banana Verde detectada! O Microondas-Telefone (nome provisório) está operando!"
  end
end

class Relatorio
  attr_accessor :nome_projeto, :autor

  def initialize(nome_projeto, autor)
    @nome_projeto = nome_projeto
    @autor = autor
  end
end

class LabRegistro
  def initialize
    @microondas = MicroondasTelefone.new 
    @relatorios = []                      
  end

  def adicionar_registro(nome_projeto, autor)
    @microondas.ativar

    relatorio = Relatorio.new(nome_projeto, autor)
    @relatorios << relatorio
  end

  def listar_experimentos
    @relatorios.each do |relatorio|
      puts "Projeto: #{relatorio.nome_projeto} | Autor: #{relatorio.autor}"
    end
  end
end

lab = LabRegistro.new

lab.adicionar_registro("KRR", "Okabe Rintaro")
lab.adicionar_registro("CERN Hack", "Kurisu Makise")
lab.adicionar_registro("PhoneWave", "Daru")

puts "\nLista de Experimentos:"
lab.listar_experimentos
