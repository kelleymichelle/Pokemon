require 'pry'
require 'catpix'

class Pokemon::Pokemon_list
  attr_accessor :name, :img_link, :type, :more_info

  @@all = []

  def initialize(name, img_link, type, more_info)
    @name = name
    @img_link = img_link
    @type = type
    @more_info = more_info
    @@all << self
  end
  
  def self.from_scrapey
    Scraper.scrapeyscrape
  end  

  def self.all
    @@all
  end
  
  def self.find_by_name(name)
    self.all.select {|mon| mon.name.downcase == name.downcase }
  end

  def self.find_by_type(type_choice)
    self.all.select {|mon| mon.type.include?(type_choice.capitalize)}
  end
  
  def self.all_types
    types = []
    self.all.each do |mon|
      types << mon.type
    end
    types.flatten.sort.uniq
  end
  
  def self.surprise_pokemon
    egg = self.all.sample
    puts egg.name
    Pokemon::CLI.new.gimme_picture_from_pokemon(egg)
  end  
  

end  