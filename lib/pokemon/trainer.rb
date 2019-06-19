
class Pokemon::Trainer
  attr_accessor :name, :pokedex
  @@all = []

  def initialize(name)
    @name = name
    @pokedex = []
    @@all << self
  end

  def self.all
    @@all
  end  

end  