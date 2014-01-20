class Restaurant

	@ratings = []

	attr_accessor :name, :address, :rating, :type_of_food, :number_rates

	class << self
		attr_accessor :ratings
	end

	# def self.ratings #class getter
	# 	@ratings
	# end

	# def self.ratings=(ratings) #class setters
	# 	@ratings = ratings
	# end


	def initialize (name, address, type_of_food)
		@name = name
		@address = address
		@type_of_food = type_of_food
		@number_rates = 0
	end


	def rate(rating)
		@number_rates += 1 
		Restaurant.ratings << rating
	end

end

blend = Restaurant.new("Blend", "3 rue du Caire", "Burgers")
tour = Restaurant.new("La tour d'Argent", "12 rue du Caire", "Gastro")
# p restos 2 = Restaurant.new("La tour d'Argent", "12 rue du Caire", 18, "Gastro")

p blend.name
blend.rate(15)
blend.rate(12)
tour.rate(8)

p blend.number_rates
p tour.number_rates

p Restaurant.ratings

# puts @@number_rating
  
