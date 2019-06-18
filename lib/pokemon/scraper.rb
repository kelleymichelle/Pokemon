require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper

  def self.scrapeyscrape
    new = []
    url = 'https://pokemondb.net/pokedex/national'
    doc = Nokogiri::HTML(open(url))
    doc.css('.infocard').each do |this|
      x = this.css('.img-sprite') 
        image = x.attr('data-src').value
        name = this.css('.ent-name').text
        type = this.css('small a').text
      new << Pokemon::Pokemon_list.new(name, image, type)
    # binding.pry
    end
    new
  end  

end  

#name = this.css('.ent-name').text
#type = this.css('small a').text
#image = x = this.css('.img-sprite') 
#             x.attr('data-src').value
