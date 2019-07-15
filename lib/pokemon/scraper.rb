require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper

  URL = 'https://pokemondb.net/pokedex/national'

  def self.scrapeyscrape
    doc = Nokogiri::HTML(open(URL))
      doc.css('.infocard').each do |this|

        url = 'https://pokemondb.net/pokedex/national'
        types = []
        picture = this.css('.img-sprite') 
          image = picture.attr('data-src').value
          name = this.css('.ent-name').text
          more_info = url.concat(this.css('a')[0].attr('href'))
          this.css('small a').each {|onetype| types << onetype.text }
            Pokemon::PokemonList.new(name, image, types, more_info)
    end
    return " ^ - ^ "
  end  

end  
