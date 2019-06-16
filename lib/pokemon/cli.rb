require 'catpix'
class Pokemon::CLI

  def call
    welcome
    name
    poke_list
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
  
  def poke_list
    arr = ["charmander", "bulbasaur", "pikachu"]

    puts "... ... ..."
    sleep 2
    puts "... ... ..."
    sleep 2
    puts "A wild pokemon is attacking!"
    sleep 2
    puts arr.sample
  end  

  
end  