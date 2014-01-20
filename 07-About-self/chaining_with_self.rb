# class Animal
#   # Modify the following methods to enable chaining !
  
#   def name(name)
#     @name = name
#   end
  
#   def specie(specie)
#     @specie = specie
#   end
  
#   def color(color)
#     @color = color
#   end
  
#   def natural_habitat(natural_habitat)
#     @natural_habitat = natural_habitat
#   end
  
# end

# # Testing chaining
# fox = Animal.new.name("Fox").specie("mammals").color("red")
# fox.natural_habitat("forest")
# puts fox.inspect


class Animal
  # Modify the following methods to enable chaining !
  
  def name(name)
    @name = name
    self
  end
  
  def specie(specie)
    @specie = specie
    self
  end
  
  def color(color)
    @color = color
    self
  end
  
  def natural_habitat(natural_habitat)
    @natural_habitat = natural_habitat
    self
  end
  
end

# Testing chaining
fox = Animal.new.name("Fox").specie("mammals").color("red")
fox.natural_habitat("forest")
puts fox.inspect

