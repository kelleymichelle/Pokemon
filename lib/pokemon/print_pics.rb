require 'catpix'
require 'mini_magick'

module PrintPics

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

end  