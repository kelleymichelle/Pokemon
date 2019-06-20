require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper

  def self.scrapeyscrape
    types = []
    new = []
    url = 'https://pokemondb.net/pokedex/national'
    doc = Nokogiri::HTML(open(url))
    doc.css('h2').each do |gen|
      generation = gen.text.split(" ")[1]
      doc.css('.infocard').each do |this|
        x = this.css('.img-sprite') 
          image = x.attr('data-src').value
          name = this.css('.ent-name').text
          this.css('small a').each {|onetype| types = onetype.text }
        new << Pokemon::Pokemon_list.new(name, image, types, generation)
      binding.pry
      end
    end
    return " ^ - ^ "
  end  

end  

#name = this.css('.ent-name').text
#type = this.css('small a').text
#image = x = this.css('.img-sprite') 
#             x.attr('data-src').value
