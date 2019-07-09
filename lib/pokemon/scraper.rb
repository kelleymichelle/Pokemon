require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper

  def self.scrapeyscrape
    new = []
    url = 'https://pokemondb.net/pokedex/national'
    doc = Nokogiri::HTML(open(url))
   
      doc.css('.infocard').each do |this|
       
        types = []
        x = this.css('.img-sprite') 
          org_url = 'https://pokemondb.net/pokedex/national'
          image = x.attr('data-src').value
          name = this.css('.ent-name').text
          more_info = org_url.concat(this.css('a')[0].attr('href'))
          this.css('small a').each {|onetype| types << onetype.text }
            new << Pokemon::PokemonList.new(name, image, types, more_info)
      
    end
    return " ^ - ^ "
  end  

end  
