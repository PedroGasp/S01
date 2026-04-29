class BebidaAfterlife
  attr_accessor :nome, :custo_base

  def initialize(nome, custo_base)
    @nome = nome
    @custo_base = custo_base
  end

  def preco_total
    @custo_base
  end
  
  def to_string
    "Bebida: #{@nome} | Valor Final: $#{preco_total}"
  end
end

class DrinkIconico < BebidaAfterlife
  attr_accessor :nivel_notoriedade

  def initialize(nome, custo_base, nivel_notoriedade)
    super(nome, custo_base)
    @nivel_notoriedade = nivel_notoriedade
  end

  def preco_total
    @custo_base + (@nivel_notoriedade * 8)
  end

  def to_string
    "Bebida: #{@nome} | Valor Final: $#{preco_total} (Notoriedade: #{@nivel_notoriedade})"
  end
end

drinks = []
drinks << DrinkIconico.new("Soul Fire", 20, 3)
drinks << DrinkIconico.new("Eternal Frost", 15, 5)
drinks << DrinkIconico.new("Phantom Whisper", 10, 2)

drinks.each do |drink|
  puts drink.to_string
end
