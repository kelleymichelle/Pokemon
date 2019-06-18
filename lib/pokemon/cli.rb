require 'catpix'
require 'pry'
require 'mini_magick'

class Pokemon::CLI

  def pry
    binding.pry
  end

  def call
    welcome
    name
    wild_poke
    starter_poke
  end

  def welcome
    # Catpix::print_image "/Users/kelleychaplain/desktop/ProfOak.gif" 
  
    puts "Hello There"
    puts "Welcome To The World Of Pokemon"
    sleep 1
    puts "My name is OAK"
    puts "People often refer to me as the Pokemon PROF"
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
    puts "#{reply}, Your very own Pokemon Legend is about to begin! A world full of dreams and adventures and Pokemon."
    sleep 1
    puts "Let's Go!"
    sleep 1
  end
  
  def wild_poke
    arr = Pokemon::Pokemon_list.all

    puts "... ... ..."
    sleep 2
    puts "... ... ..."
    sleep 2
    puts "A wild pokemon is attacking!"
    sleep 2
    puts arr.sample
    sleep 2
    puts "Quick! Go into my bag and choose a Pokemon!"
  end
  
  def starter_poke
    # arr = ["charmander", "bulbasaur", "squirtle"]
    arr = Pokemon::Pokemon_list.all.values_at(0, 3, 6)
    # binding.pry
    sleep 2
    arr.each {|mon| puts mon.name }
  end

  def gimme_picture_from_pokemon(poke)
    image = MiniMagick::Image.open(poke.img_link)
    Catpix::print_image image.path
  end
  
  def gimme_picture_from_link(link)
    image = MiniMagick::Image.open('link')
    Catpix::print_image image.path
  end
  
  def scrape
    Scraper.scrapeyscrape
  end  

  
end  