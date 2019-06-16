require 'catpix'
class Pokemon::CLI

  def call
    welcome
    name
  end

  def welcome
    Catpix::print_image "/Users/kelleychaplain/desktop/ProfOak.gif" 
    puts <<-DOC
    Hello There
    Welcome To The World Of Pokemon
    My name is OAK
    People often refer to me as the Pokemon PROF
    This World is inhabited by creatures known as Pokemon
    For Some People Pokemon are Pets
    Others use them for battle
    As for myself 
    I study Pokemon as a profession
    DOC 
  end
  
  def name
    puts "But tell me about yourself, What is your name?"
    reply = gets.chomp
    puts "#{reply}, Your very own Pokemon Legend is about to begin! A world full of dreams and adventures and Pokemon."
    puts "Let's Go!"
  end  

  
end  