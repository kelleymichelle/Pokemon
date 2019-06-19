require 'pry'
require 'catpix'

class Pokemon::Pokemon_list
  attr_accessor :name, :img_link, :type

  @@all = []

  def initialize(name, img_link, type)
    @name = name
    @img_link = img_link
    @type = type
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
  

end  