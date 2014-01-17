class OrangeTree
  
  def initialize
    @dead = false
    @age = 0
    @height = 0
    @oranges = 0
  end

  def measure_height
    if @dead == true 
      puts "Oh, no! The tree is too old, and has died"
    else 
      puts "#{@height} cm"
    end 
  end
  
  def count_the_oranges
    if @dead == true 
      puts "They are no oranges because he's dead"
    else 
      puts "#{@oranges} oranges"
    end
  end
  
  def pick_an_orange
    if @dead == true 
      puts "They are no oranges because he's dead"
    else 
      puts "You pick a delicious juicy orange"
      @oranges = @oranges - 1
    end
  end
  
  def one_year_passes
    @age = @age + 1
    if @age > 25 
      @dead = true 
      puts "Oh, no! The tree is too old, and has died"
    else
    @height = @height + 30
    @oranges = @oranges + rand(0..15)
    puts "This year your tree grew to #{@height} cm tall, and has #{@oranges} oranges" 
    end
  end
end

orange_tree = OrangeTree.new
23.times { orange_tree.one_year_passes }
puts(orange_tree.one_year_passes)
# => This year your tree grew to 9.6 m tall, and produced 119 oranges
puts(orange_tree.count_the_oranges)
# => 119 oranges
puts(orange_tree.pick_an_orange)
# => You pick a delicious juicy orange
puts(orange_tree.count_the_oranges)
# => 118 oranges
puts(orange_tree.measure_height)
# => 9.6 m
puts(orange_tree.one_year_passes)
# => This year your tree grew to 10.0 m tall, and produced 125 oranges
puts(orange_tree.one_year_passes)
# => This year your tree grew to 10.4 m tall, and produced 131 oranges
puts(orange_tree.one_year_passes)
# => Oh, no! The tree is too old, and has died..
puts(orange_tree.one_year_passes)
# => A year later, the tree is still dead..
puts(orange_tree.count_the_oranges)
# => A dead tree has no oranges..
puts(orange_tree.pick_an_orange)
# => A dead tree has nothing to offer..

