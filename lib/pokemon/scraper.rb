require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper

  def self.scrapeyscrape
    
    new = []
    url = 'https://pokemondb.net/pokedex/national'
    doc = Nokogiri::HTML(open(url))
    # binding.pry
    # doc.css('h2').each do |gen|
      doc.css('.infocard').each do |this|
        # binding.pry
        # generation = gen.text.split(" ")[1]
        types = []
        x = this.css('.img-sprite') 
          image = x.attr('data-src').value
          name = this.css('.ent-name').text
          more_info = this.css('a')[0].attr('href')
          this.css('small a').each {|onetype| types << onetype.text }
            new << Pokemon::Pokemon_list.new(name, image, types, more_info)
    end
    return " ^ - ^ "
  end  

end  

#name = this.css('.ent-name').text
#type = this.css('small a').text
#image = x = this.css('.img-sprite') 
#             x.attr('data-src').value
