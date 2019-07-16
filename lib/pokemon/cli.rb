require 'pry'
require_relative './print_pics.rb'

class Pokemon::CLI
  include PrintPics

  attr_accessor :trainer

  def run
    scrape
    welcome
    trainer_name
    wild_poke
    starter_poke
    pokemon_reply
    prof_script
    pokedex_menu
  end

  def welcome
    
    puts "\n\n\nHello There\n\n\n"
    puts "\n\n\nWelcome To The World Of Pokemon\n\n\n"
    sleep 2
    puts "\nMy name is OAK\n"
    sleep 2
    puts "\nPeople often refer to me as the Pokemon PROF\n"
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
  
  def trainer_name
    puts "\nBut tell me about yourself, What is your name?\n"
    reply = gets.chomp
    @trainer = Pokemon::Trainer.new(reply)
    puts "\n#{reply}, Your very own Pokemon Legend is about to begin! A world full of dreams and adventures and Pokemon.\n"
    sleep 1
    puts "\nLet's Go!\n"
    sleep 3
  end
  
  def wild_poke
    wild_pokemon = Pokemon::PokemonList.all.sample

    puts "\n\n...\n\n"
    sleep 3
    puts "\n\n...\n\n"
    sleep 3
    puts "\nA wild pokemon is attacking!\n"
    sleep 3
    gimme_picture_from_pokemon(wild_pokemon)
    puts "\nIt's a wild #{wild_pokemon.name}!\n"
    sleep 3
    puts "\nQuick! Go into my bag and choose a Pokemon!\n"
  end
  
  def starter_poke
    # arr = ["charmander", "bulbasaur", "squirtle"]
    arr = Pokemon::PokemonList.all.values_at(0, 3, 6)
    sleep 2
    arr.each {|mon| puts " -> #{mon.name}" }
  end  

  def pokemon_reply
    puts "\nType its name to choose a Pokemon!\n"
    reply = gets.chomp
      if Pokemon::PokemonList.all_names.include?(reply.capitalize)
        @trainer.pokedex = Pokemon::PokemonList.find_by_name(reply)
        choose_you
      else
        pokemon_reply
      end 
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
    puts "\n-> To learn more about a certain pokemon, enter name of pokemon\n"
    puts "\n-> To see pokemon of a specific type, enter pokemon type.\n"
    puts "\n-> To see a list of pokemon types, enter 'types'\n"
    puts "\n-> To learn about a random pokemon, enter 'surprise'\n"
    puts "\n-> To exit, enter 'exit'\n"
    reply = gets.chomp
    case
    when reply == "types"
      reply_types
      sleep 4
      pokedex_menu
    when reply == "surprise"
      surprise_pokemon
      sleep 4
      pokedex_menu
    when Pokemon::PokemonList.all_types.include?(reply.capitalize)
      find_by_type(reply)
      sleep 4
      pokedex_menu
    when Pokemon::PokemonList.all_names.include?(reply.capitalize)
      turning_out_pokemon(reply)
      sleep 4
      pokedex_menu
    when reply == "exit"
      puts "\nGoodbye Pokemon Trainer!\n"
    else
      puts "\nInvalid entry\n"
      sleep 2
      pokedex_menu      
    end  
  end

  def surprise_pokemon
    egg = Pokemon::PokemonList.all.sample
    gimme_picture_from_pokemon(egg)
    puts "-> Name : #{egg.name}"
    puts "-> Type : #{egg.type}"
    puts "-> More Information : #{egg.more_info}"
  end  

  def turning_out_pokemon(x)
      pocket_monster = Pokemon::PokemonList.find_by_name(x)[0]
      gimme_picture_from_pokemon(pocket_monster)
      puts " -> Name : #{pocket_monster.name}"
      puts " -> Type: #{pocket_monster.type}"
      puts " -> More Information: #{pocket_monster.more_info}"
  end  

  def reply_types
    Pokemon::PokemonList.all_types.each {|type| puts "-> #{type}"}
  end
  
  def find_by_type(type_choice)
    poke_type = Pokemon::PokemonList.all.select {|mon| mon.type.include?(type_choice.capitalize)}
    poke_type.count puts "There are #{poke_type.count} #{type_choice} pokemon."
    new_arr = poke_type.sort_by {|obj| obj.name}
    sleep 2
    new_arr.each {|poke| puts "-> #{poke.name}"}
  end

  def scrape
    Scraper.scrapeyscrape
  end  

  
end  