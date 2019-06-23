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
    prof_script
    pokedex_menu
  end

  def welcome
    
    puts "\n\nHello There\n\n"
    puts "\n\nWelcome To The World Of Pokemon\n\n"
    sleep 2
    puts "\nMy name is OAK\n"
    sleep 2
    puts "\nPeople often refer to me as the Pokemon PROF\n"
    # binding.pry
    gimme_picture_from_link('https://www.pojo.com/cartoon/Oak.gif')
    sleep 2
    puts "\nThis world is inhabited by creatures known as Pokemon\n"
    sleep 2
    puts "\nFor some people Pokemon are pets\n"
    sleep 2
    puts "\nOthers use them for battle\n"
    sleep 2
    puts "\nAs for myself\n" 
    sleep 2
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
    sleep 3
    puts "\n\n...\n\n"
    sleep 3
    puts "\nA wild pokemon is attacking!\n"
    sleep 3
    gimme_picture_from_pokemon(x)
    puts "\nIt's a wild #{x.name}!\n"
    sleep 3
    puts "\nQuick! Go into my bag and choose a Pokemon!\n"
  end
  
  def starter_poke
    # arr = ["charmander", "bulbasaur", "squirtle"]
    arr = Pokemon::Pokemon_list.all.values_at(0, 3, 6)
    # binding.pry
    sleep 2
    arr.each {|mon| puts " -> #{mon.name}" }
    puts "\nType its name to choose a Pokemon!\n"
    reply = gets.chomp
    @trainer.pokedex = Pokemon::Pokemon_list.find_by_name(reply)
    # binding.pry
  end

  def choose_you
    puts "\nI choose you - #{@trainer.pokedex[0].name}!!!\n"
    sleep 3
    gimme_picture_from_pokemon(@trainer.pokedex[0])
    sleep 3
    puts "\nBoom... Pow... Bang...\n"
    sleep 3
    puts "\nThe wild pokemon fainted!\n"
    sleep 3
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

  def prof_script
    puts "\nPROF - Phew! That was a close one! Go ahead and keep that #{@trainer.pokedex[0].name}.\n" 
    sleep 3
    puts "\nAnd as my way of thanks, here's a Pokedex. I've loaded information on every pokemon!\n"
    sleep 3
    puts "\nWith this Pokedex, you can find pokemon by their name or type. You can view a picture and get more information.\n"
    sleep 3
    puts "\nLet's try it out now!\n"
    sleep 3
    puts "\nFiring up Pokedex . . .\n"
    sleep 4
  end
  
  def pokedex_menu
    puts "\nTo learn more about a certain pokemon, enter name of pokemon\n"
    puts "\nTo see pokemon of a specific type, enter pokemon type.\n"
    puts "\nTo see a list of pokemon types, enter 'types'\n"
    puts "\nTo learn about a random pokemon, enter 'surprise'\n"
    puts "\nTo exit, enter 'exit'\n"
    reply = gets.chomp
    case
    when reply == "types"
      reply_types
      pokedex_menu
    when reply == "surprise"
      Pokemon::Pokemon_list.surprise_pokemon
      pokedex_menu
    when Pokemon::Pokemon_list.all_types.include?(reply.capitalize)
      Pokemon::Pokemon_list.find_by_type(reply)    
    end  
  end

  def reply_types
    Pokemon::Pokemon_list.all_types.each {|type| puts type}
  end  

  def scrape
    Scraper.scrapeyscrape
  end  

  
end  