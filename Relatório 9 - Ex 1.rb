class Musico
  attr_accessor :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(obra)
    raise NotImplementedError, "Este método deve ser implementado pelas subclasses"
  end
end

class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  def tocar_partitura(obra)
    puts "#{@nome} toca #{obra} no #{@instrumento} com notas suaves."
  end
end

class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  def tocar_partitura(obra)
    puts "#{@nome} executa #{obra} no #{@instrumento} com intensidade."
  end
end

class Maestro
  def initialize
    @musicos = []
  end

  def adicionar_musico(musico)
    @musicos << musico
  end

  def iniciar_concerto(obra)
    puts "Iniciando a obra: #{obra}"
    @musicos.each do |musico|
      musico.tocar_partitura(obra)
    end
  end

  def ajustar_postura(estado)
    @musicos.map do |musico|
      "#{musico.nome} está em ritmo #{estado}!"
    end
  end
end

maestro = Maestro.new

p1 = Pianista.new("Kosei Arima")
v1 = Violinista.new("Kaori Miyazono")

maestro.adicionar_musico(p1)
maestro.adicionar_musico(v1)

obra = "Balada da Primavera"

maestro.iniciar_concerto(obra)

puts "\nAjuste de postura:"
puts maestro.ajustar_postura("Allegro")
