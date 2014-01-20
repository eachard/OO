class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @date = Time.now
    @reason = "no given"
  end
  
  def to_s
  	if @amount > 0
  		"You deposit #{@amount} euros on #{@date.strftime("%m/%d/%Y")}"
    else
    	"You withdraw #{@amount} euros on #{@date.strftime("%m/%d/%Y")}"
  	end
	end
end
