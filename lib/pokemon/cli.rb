require 'catpix'
require 'pry'
require 'mini_magick'

class Pokemon::CLI
  attr_accessor :trainer

  def pry
    binding.pry
  end

  def run
    scrape
    welcome
    name
    wild_poke
    starter_poke
    choose_you
  end

  def welcome
    
    puts "\n\nHello There\n\n"
    puts "\n\nWelcome To The World Of Pokemon\n\n"
    sleep 1
    puts "\nMy name is OAK\n"
    sleep 1
    puts "\nPeople often refer to me as the Pokemon PROF\n"
    # binding.pry
    gimme_picture_from_link('https://www.pojo.com/cartoon/Oak.gif')
    sleep 1
    puts "\nThis world is inhabited by creatures known as Pokemon\n"
    sleep 1
    puts "\nFor some people Pokemon are pets\n"
    sleep 1
    puts "\nOthers use them for battle\n"
    sleep 1
    puts "\nAs for myself\n" 
    sleep 1
    puts "\nI study Pokemon as a profession\n"
    sleep 3
   
  end
  
  def name
    puts "\nBut tell me about yourself, What is your name?\n"
    reply = gets.chomp
    @trainer = Pokemon::Trainer.new(reply)
    # binding.pry
    puts "\n#{reply}, Your very own Pokemon Legend is about to begin! A world full of dreams and adventures and Pokemon.\n"
    sleep 1
    puts "\nLet's Go!\n"
    sleep 3
  end
  
  def wild_poke
    x = Pokemon::Pokemon_list.all.sample

    puts "\n\n...\n\n"
    sleep 2
    puts "\n\n...\n\n"
    sleep 2
    puts "\nA wild pokemon is attacking!\n"
    sleep 2
    gimme_picture_from_pokemon(x)
    puts "\nIt's a wild #{x.name}!\n"
    sleep 2
    puts "\nQuick! Go into my bag and choose a Pokemon!\n"
  end
  
  def starter_poke
    # arr = ["charmander", "bulbasaur", "squirtle"]
    arr = Pokemon::Pokemon_list.all.values_at(0, 3, 6)
    # binding.pry
    sleep 2
    arr.each {|mon| puts " -> #{mon.name}" }
    puts "Type its name to choose a Pokemon!"
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