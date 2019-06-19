require 'catpix'
require 'pry'
require 'mini_magick'

class Pokemon::CLI
  attr_accessor :trainer

  def pry
    binding.pry
  end

  def call
    scrape
    welcome
    name
    wild_poke
    starter_poke
    choose_you
  end

  def welcome
    
    puts "Hello There"
    puts "Welcome To The World Of Pokemon"
    sleep 1
    puts "My name is OAK"
    puts "People often refer to me as the Pokemon PROF"
    sleep 1
    # binding.pry
    gimme_picture_from_link('https://www.pojo.com/cartoon/Oak.gif')
    sleep 1
    puts "This World is inhabited by creatures known as Pokemon"
    puts "For Some People Pokemon are Pets"
    puts "Others use them for battle"
    puts "As for myself" 
    puts "I study Pokemon as a profession"
    sleep 1
   
  end
  
  def name
    puts "But tell me about yourself, What is your name?"
    reply = gets.chomp
    @trainer = Pokemon::Trainer.new(reply)
    # binding.pry
    puts "#{reply}, Your very own Pokemon Legend is about to begin! A world full of dreams and adventures and Pokemon."
    sleep 1
    puts "Let's Go!"
    sleep 1
  end
  
  def wild_poke
    x = Pokemon::Pokemon_list.all.sample

    puts "... ... ..."
    sleep 2
    puts "... ... ..."
    sleep 2
    puts "A wild pokemon is attacking!"
    sleep 2
    gimme_picture_from_pokemon(x)
    puts x.name
    sleep 2
    puts "Quick! Go into my bag and choose a Pokemon!"
  end
  
  def starter_poke
    # arr = ["charmander", "bulbasaur", "squirtle"]
    arr = Pokemon::Pokemon_list.all.values_at(0, 3, 6)
    # binding.pry
    sleep 2
    arr.each {|mon| puts mon.name }
    puts "Choose a Pokemon!"
    reply = gets.chomp
    @trainer.pokedex = Pokemon::Pokemon_list.find_by_name(reply)
    # binding.pry
  end

  def choose_you
    puts "I choose you - #{@trainer.pokedex[0].name}!!!"
    sleep 2
    gimme_picture_from_pokemon(@trainer.pokedex[0])
  end  

  def gimme_picture_from_pokemon(poke)
    image = MiniMagick::Image.open(poke.img_link)
    image.resize '50x50'
    Catpix::print_image image.path
  end
  
  def gimme_picture_from_link(linky)
    image = MiniMagick::Image.open(linky)
    image.resize '50x50'
    Catpix::print_image image.path
  end
  
  def scrape
    Scraper.scrapeyscrape
  end  

  
end  