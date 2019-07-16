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

  def self.find_by_name(name)
    self.all.select {|mon| mon.name == name.capitalize}
  end  

  def self.all_names
    self.all.map {|mon| mon.name}.sort
  end
  
  def self.all_types
    self.all.map {|mon| mon.type}.flatten.sort.uniq
  end

end  