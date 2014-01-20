module DemoModule

  def self.introduce
    puts "5. self from module method : #{self.inspect} | #{self.class}=> DemoModule"
  end

  class DemoClass  

    puts "1. self from class definition : #{self.inspect} | #{self.class} = DemoClass"

    def introduce
      @whatever = "whatever text"
      puts "4. self from instance method : #{self.inspect} | #{self.class} => Objet de De"
    end

    def self.introduce
      puts "3. self from class method : #{self.inspect} | #{self.class} => DemoClass"
    end    
  end

  puts "2. self from module definition : #{self.inspect} | #{self.class} => Module"

end

DemoModule::DemoClass.introduce 
DemoModule::DemoClass.new.introduce
DemoModule::introduce