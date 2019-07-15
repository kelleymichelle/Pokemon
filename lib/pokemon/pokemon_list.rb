require 'pry'
require_relative './print_pics.rb'

class Pokemon::PokemonList
  extend PrintPics

  attr_accessor :name, :img_link, :type, :more_info

  @@all = []

  def initialize(name, img_link, type, more_info)
    @name = name
    @img_link = img_link
    @type = type
    @more_info = more_info
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def self.find_by_name_cli(name)
    self.all.select {|mon| mon.name.downcase == name.downcase}
        pocket_monster = mon
      gimme_picture_from_pokemon(pocket_monster)
    puts " -> Name : #{pocket_monster.name}"
    puts " -> Type: #{pocket_monster.type}"
    puts " -> More Information: #{pocket_monster.more_info}"
      # end
    # end  
  end

  def self.find_by_name(name)
    self.all.select {|mon| mon.name == name.capitalize}
  end  

  def self.all_names
    self.all.map {|mon| mon.name}.sort
  end


  # def self.find_by_type(type_choice)
  #   poke_type = self.all.select {|mon| mon.type.include?(type_choice.capitalize)}
  #   poke_type.count puts "There are #{poke_type.count} #{type_choice} pokemon."
  #   new_arr = poke_type.sort_by {|obj| obj.name}
  #   sleep 2
  #   new_arr.each {|poke| puts "-> #{poke.name}"}
  # end
  
  def self.all_types
    self.all.map {|mon| mon.type}.flatten.sort.uniq
  end
  
  # def self.surprise_pokemon
  #   egg = self.all.sample
  #   gimme_picture_from_pokemon(egg)
  #   puts "-> Name : #{egg.name}"
  #   puts "-> Type : #{egg.type}"
  #   puts "-> More Information : #{egg.more_info}"
  # end  
  

end  